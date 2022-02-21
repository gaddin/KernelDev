bits 16
[org 0x7c00]
kernel 0x7ef0
_entry16:
	mov ah, 0x0		;set-video-mode
	mov al, 0x2		;tty
	int 0x10		
	mov ah, 0x1
	mov cx, 1 << 13
	int 0x10
	mov ah, 0x6
	xor al, al
	xor cx, cx
	mov dx, 0x184f
	int 0x10
	mov ah, 0x2		;
	mov al, 63		; <---TODO: FIX DAT SHIT(maybe)
	mov ch, 0x1		;
	mov cl, 0x2		;
	mov dh, 0x1
	mov dl, 0x1
	mov bx, 0x7e00
	int 0x13
	cli
	jmp lodgdt

GDT_Start:
    null_descriptor:
        dd 0
        dd 0
    code_descriptor:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10011010	; binary
        db 0b11001111	; binary
        db 0x0
    data_descriptor:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10010010	; binary
        db 0b11001111	; binary
        db 0
GDT_END:
GDT_Descriptor:
    dw GDT_END - GDT_Start - 1
    dd GDT_Start
CODE_SEG equ code_descriptor - GDT_Start 
DATA_SEG equ data_descriptor - GDT_Start

lodgdt:
	lgdt [GDT_Descriptor]
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp CODE_SEG:_pm
bits 32
_pm:
	
times 510($-$$) db 0
dw 0xAA55			;bootsig

_sector2:
	mov [0xb8000], 'O'
	mov [0xb8002], 'O'
	mov [0xb8004], 'F'
call kernel	
times 1024($-$$) db 0		; padding for second sector
