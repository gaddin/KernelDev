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
	mov ah, 0x2		
	mov al, 0x80		
	mov ch, 0x1		
	mov cl, 0x2		
	mov dh, 0x80
	mov dl, 0x1
	mov bx, 0x7e00
	int 0x13
	cli
	jmp lodgdt
%include "../GDT/GDT.asm"

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
