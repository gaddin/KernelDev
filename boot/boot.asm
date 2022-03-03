[bits 16]
kernel equ 0x7ef0
[org 0x7c00]
_start:
	mov ax, 0x2
	int 0x10
	mov ah, 0x06   
	xor al, al    
	xor cx, cx   
	mov dx, 0x184F 
	mov bh, 0x1f   
	int 0x10
	mov ah, 0x1		
	mov cx, 0x1 << 13	;disable cursor 
	int 0x10

	xor ax, ax
	xor cx, cx
	mov ah, 0x2
	mov al, 0x80
	mov dh, 0x0
	mov dl, 0x80
	mov cl, 0x2
	mov bx, 0x7e00
	int 0x13
	mov sp, 0x7c00
	mov bp, 0x7c00

	cli
	lgdt [.gdtdes]
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp CSE:pm
; offset 0x0
.gdtstart:
.nulldescriptor:
	dq 0

; offset 0x8
.code:				; cs should point to this descriptor
	dw 0xffff		; segment limit first 0-15 bits
	dw 0			; base first 0-15 bits
	db 0			; base 16-23 bits
	db 0x9a			; access byte
	db 0b11001111		; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0			; base 24-31 bits

; offset 0x10
.data:				; ds, ss, es, fs, and gs should point to this descriptor
	dw 0xffff		; segment limit first 0-15 bits
	dw 0			; base first 0-15 bits
	db 0			; base 16-23 bits
	db 0x92			; access byte
	db 0b11001111		; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0			; base 24-31 bits
.gdtend:
.gdtdes:
	dw .gdtend - .gdtstart - 1
	dd .gdtstart
CSE equ .code - .gdtstart
DSE equ .data - .gdtstart

[bits 32]
pm:
	jmp sec2
	jmp $	
times 510 - ($-$$) db 0
dw 0xaa55
sec2:

	call kernel
	hlt
times 1024 - ($-$$) db 0
