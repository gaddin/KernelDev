bits 16
[org 0x7c00]
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
	cli
	jmp lodgdt


lodgdt:

times 510($-$$) db 0
dw 0xAA55			;bootsig
