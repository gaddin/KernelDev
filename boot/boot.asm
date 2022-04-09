
[bits 16]
kernel equ 0x7f00
[org 0x7c00]
jmp _startb
disk:
db 0x0
_startb:
	mov [disk], dl
	mov ax, 0x2401
	int 0x15

	mov ax, 0x3
	int 0x10

	mov ah, 0x2
	mov al, 127
	mov ch, 0
	mov dl, [disk]
	mov cl, 2
	mov bx, sec2
	int 0x13
	mov ah, 0x06
	xor al, al
	xor cx, cx
	mov dx, 0x184F
	mov bh, 0x1f
	int 0x10

	mov ah, 0x1
	mov cx, 0x1 << 13	;disable cursor
	int 0x10
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
	mov ax, DSE
	mov ds, ax
	mov ss, ax
	jmp sec2
times 510 - ($-$$) db 0
dw 0xaa55
sec2:
	mov byte [0xb8000], 'O'
	mov byte [0xb8002], 'x'
	mov byte [0xb8004], 'y'
	mov byte [0xb8006], 'k'
	mov byte [0xb8008], 'u'
	mov byte [0xb800a], 's'
	mov byte [0xb800c], 'h'
	mov byte [0xb800e], ' '
	mov byte [0xb8010], 'O'
	mov byte [0xb8012], 'S'
	mov byte [0xb8014], '!'
	mov esp, kernel_stack_top
	call kernel
	jmp $
	hlt
times 1024 - ($-$$) db 0
section .bss
align 4
kernel_stack_bottom: equ $
	resb 32768
kernel_stack_top:
