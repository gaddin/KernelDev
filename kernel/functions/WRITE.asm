CROSS_WRITE:
.loop:
    lodsb
	cmp             al, 0x0
    je              .terminate
	cmp				al, '\'
	je				.esc_seq
    mov             [0xb8000 + ebx], ax 
    add             ebx, 0x2
    jmp             .loop
.terminate:
    ret
.esc_seq:
	lodsb
	cmp				al, 'n'
	je				.nl
	cmp				al, 't'
	je				.tab
	cmp				al, '['
	je				.col
	jmp				.loop
.col:
	lodsb
	cmp				al, 'R'
	je				.red
	cmp				al, 'G'
	je				.green
	cmp				al, 'r'
	je				.reset
	cmp				al, 'C'
	je				.cyan
.red:
	mov				ah, 0xc
	jmp .loop
.cyan:
	mov				ah, 0x3
	jmp .loop
.green:
	mov				ah, 0x2
	jmp .loop
.reset:
	mov				ah, 0xf
	jmp .loop
.nl:
	add ecx, 0xa0
	mov ebx, ecx
	jmp .loop
.tab:
	add ecx, 0x8	
	jmp .loop
