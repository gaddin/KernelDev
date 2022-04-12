;	this is only a temporary bootloader so i can load the kernel into memory. 
;	I stole the GDT from wikipedia
;	the kernel will be loaded via grub in the future
;
;
[bits 16]
kernel equ 0x7f00
VGA_MEM equ 0xb8000
[org 0x7c00]
jmp _startb
stop:
	hlt
	jmp stop
disk:
db 0x0
_startb:
	mov [disk], dl		; the bios populates dl with the drive number so we need to save it for later
				
	mov ax, 0x2
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
	db 0xcf		; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0x0			; base 24-31 bits
;	db 0xffff0000009acf00ffff00000092cf00
; offset 0x10
.data:				; ds, ss, es, fs, and gs should point to this descriptor
	dw 0xffff		; segment limit first 0-15 bits
	dw 0			; base first 0-15 bits
	db 0			; base 16-23 bits
	db 0x92			; access byte
	db 0xcf			; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0x0			; base 24-31 bits
.gdtend:
.gdtdes:
	dw .gdtend - .gdtstart - 1
	dd .gdtstart
CSE equ .code - .gdtstart
DSE equ .data - .gdtstart
[bits 32]
pm:
	mov ax, DSE
	mov ss, ax
	mov ds, ax
	mov ax, 0x0
	mov fs, ax
	mov gs, ax
	mov es, ax
	jmp sec2
times 510 - ($-$$) db 0
dw 0xaa55
sec2:
	mov esp, kernel_stack_top
	call kernel
	jmp stop
times 1024 - ($-$$) db 0
section .bss
align 4
kernel_stack_bottom: equ $
	resb 32768
kernel_stack_top:
