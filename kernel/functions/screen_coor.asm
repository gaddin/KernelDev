cls:	
	mov			ah, 0x2
	xor			al, al
	xor			bx, bx
	xor			cx, cx
	int			0x10
	ret
col:
	mov			ah, 0x6
	xor			al, al
	mov			bh, ch
	mov			cx, 0x0
	mov			dx, 0x184f
	int			0x10
	ret
