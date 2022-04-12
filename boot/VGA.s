	.file	"VGA.c"
	.text
	.globl	vga_printc
	.type	vga_printc, @function
vga_printc:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movb	%cl, -28(%ebp)
	movb	%dl, -32(%ebp)
	movb	%al, -36(%ebp)
	movl	$753664, -12(%ebp)
	movsbl	-32(%ebp), %ecx
	movsbl	-36(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	addl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movzbl	-28(%ebp), %edx
	movb	%dl, (%eax)
	addl	$1, -12(%ebp)
	subl	$8, %esp
	pushl	$1
	pushl	$15
	call	vga_color
	addl	$16, %esp
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movb	%dl, (%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	vga_printc, .-vga_printc
	.globl	vga_prints
	.type	vga_prints, @function
vga_prints:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movb	%dl, -28(%ebp)
	movb	%al, -32(%ebp)
	movl	$0, -12(%ebp)
.L4:
	movsbl	-32(%ebp), %ecx
	movl	-12(%ebp), %eax
	movl	%eax, %edx
	movzbl	-28(%ebp), %eax
	addl	%edx, %eax
	movsbl	%al, %edx
	movl	-12(%ebp), %ebx
	movl	8(%ebp), %eax
	addl	%ebx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$4, %esp
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	vga_printc
	addl	$16, %esp
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L4
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	vga_prints, .-vga_prints
	.globl	vga_color
	.type	vga_color, @function
vga_color:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movb	%dl, -4(%ebp)
	movb	%al, -8(%ebp)
	movsbl	-8(%ebp), %eax
	sall	$4, %eax
	orb	-4(%ebp), %al
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	vga_color, .-vga_color
	.globl	vga_strlength
	.type	vga_strlength, @function
vga_strlength:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
.L9:
	addl	$1, -4(%ebp)
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L9
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	vga_strlength, .-vga_strlength
	.ident	"GCC: (GNU) 7.1.0"
