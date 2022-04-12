	.file	"kernel_entry.c"
	.text
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$1702129253, -23(%ebp)
	movl	$543450482, -19(%ebp)
	movl	$1852990827, -15(%ebp)
	movw	$27749, -11(%ebp)
	movb	$0, -9(%ebp)
	subl	$4, %esp
	pushl	$0
	pushl	$0
	leal	-23(%ebp), %eax
	pushl	%eax
	call	vga_prints
	addl	$16, %esp
	call	enable_a20
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.ident	"GCC: (GNU) 7.1.0"
