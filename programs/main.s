	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	find
	.type	find, @function
find:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	-40(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L2
.L7:
	movl	$0, -8(%rbp)
	jmp	.L3
.L5:
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L4
	movl	-16(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L5
.L4:
	movl	-8(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jne	.L6
	addl	$1, -12(%rbp)
.L6:
	addl	$1, -16(%rbp)
.L2:
	movl	-36(%rbp), %eax
	subl	-4(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L7
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	find, .-find
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1872, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	stdin(%rip), %rdx
	leaq	-10032(%rbp), %rax
	movl	$10000, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movl	$0, -10060(%rbp)
	jmp	.L9
.L10:
	addl	$1, -10060(%rbp)
.L9:
	movl	-10060(%rbp), %eax
	cltq
	movzbl	-10032(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L10
	subl	$1, -10060(%rbp)
	movl	$1818847351, -10044(%rbp)
	movw	$101, -10040(%rbp)
	movw	$28516, -10056(%rbp)
	movb	$0, -10054(%rbp)
	movl	$7630441, -10053(%rbp)
	movl	$1918986339, -10049(%rbp)
	movb	$0, -10045(%rbp)
	movl	$1851876211, -10038(%rbp)
	movw	$102, -10034(%rbp)
	movl	-10060(%rbp), %edx
	leaq	-10044(%rbp), %rsi
	leaq	-10032(%rbp), %rax
	movl	$5, %ecx
	movq	%rax, %rdi
	call	find
	movl	-10060(%rbp), %edx
	leaq	-10056(%rbp), %rsi
	leaq	-10032(%rbp), %rax
	movl	$2, %ecx
	movq	%rax, %rdi
	call	find
	movl	-10060(%rbp), %edx
	leaq	-10053(%rbp), %rsi
	leaq	-10032(%rbp), %rax
	movl	$3, %ecx
	movq	%rax, %rdi
	call	find
	movl	-10060(%rbp), %edx
	leaq	-10049(%rbp), %rsi
	leaq	-10032(%rbp), %rax
	movl	$4, %ecx
	movq	%rax, %rdi
	call	find
	movl	-10060(%rbp), %edx
	leaq	-10038(%rbp), %rsi
	leaq	-10032(%rbp), %rax
	movl	$5, %ecx
	movq	%rax, %rdi
	call	find
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
