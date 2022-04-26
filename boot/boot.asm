; Author: Francisco Fischer 2021 - 2022
; This is only a temporary bootloader to load the kernel into memory. 
; The GDT has been copied from: https://de.wikipedia.org/wiki/GDT.
; The kernel will be loaded via grub in the future.
KERNEL_ADDRESS equ 0x7f00
[bits 16]
[org 0x7c00]
jmp ENTRY
HALT:
	hlt
	jmp HALT
ENTRY:
	mov ah, 2
	mov al, 127
	mov ch, 0
	mov cl, 2
	mov bx, SECTOR_2
	int 0x13
	mov ax, 2
	int 0x10
	mov ah, 6
	xor al, al
	xor cx, cx
	mov dx, 0x184F
	mov bh, 0x0f
	int 0x10
	mov ah, 1
	mov cx, (0x1 << 13)	; disable cursor
	int 0x10
	cli
	lgdt [.gdtdes]
	mov eax, cr0
	or eax, 1		; set protectedmode bit 
	mov cr0, eax	
	jmp CODE_SEGMENT_DESCRIPTOR : protected_mode
.gdtstart:
.nulldescriptor:
	dq 0
.code_descriptor:	    	; cs should point to this descriptor
	dw 0xffff		; segment limit first 0-15 bits
	dw 0			; base first 0-15 bits
	db 0			; base 16-23 bits
	db 0x9a			; access byte
	db 0xcf			; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0			; base 24-31 bits
.data_descriptor:      		; ds, ss, es, fs, and gs should point to this descriptor
	dw 0xffff		; segment limit first 0-15 bits
	dw 0			; base first 0-15 bits
	db 0			; base 16-23 bits
	db 0x92			; access byte
	db 0xcf			; high 4 bits (flags) low 4 bits (limit 4 last bits)(limit is 20 bit wide)
	db 0			; base 24-31 bits
.gdtend:
.gdtdes:
	dw .gdtend - .gdtstart - 1
	dd .gdtstart
CODE_SEGMENT_DESCRIPTOR equ .code - .gdtstart ; calculate the CODE segment address relative to the gdt-start
DATA_SEGMENT_DESCRIPTOR equ .data - .gdtstart ; claculate the DATA segment address relative to the gdt-start
[bits 32]
protected_mode:
	mov ax, DATA_SEGMENT_DESCRIPTOR
	mov ss, ax
	mov ds, ax
	mov es, ax
	mov ax, 0		; 
	mov fs, ax
	mov gs, ax
	jmp SECTOR_2
times 510 - ($-$$) db 0
dw 0xaa55			; MBR signature
SECTOR_2:
	mov esp, KERNEL_STACK_TOP
	call KERNEL_ADDRESS
	jmp HALT
times 1024 - ($-$$) db 0
section .bss
align 4
KERNEL_STACK_BOTTOM: equ $
	resb 32768
KERNEL_STACK_TOP:
