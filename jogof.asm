	.file	"jogo.c"
	.section .rdata,"dr"
LC0:
	.ascii "\12\12#####JOGO DA VELHA#####\12\0"
LC1:
	.ascii "  %c  |  %c  |  %c  \12\0"
LC2:
	.ascii "-----------------\0"
	.text
	.globl	_Tabuleiro
	.def	_Tabuleiro;	.scl	2;	.type	32;	.endef
_Tabuleiro:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_puts
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	movsbl	%al, %ecx
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$LC2, (%esp)
	call	_puts
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	2(%eax), %eax
	movsbl	%al, %ecx
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$LC2, (%esp)
	call	_puts
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	movsbl	%al, %ecx
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	1(%eax), %eax
	movsbl	%al, %edx
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	nop
	leave
	ret
	.section .rdata,"dr"
LC3:
	.ascii "Jogador 1 venceu!\0"
LC4:
	.ascii "Jogador 2 venceu!\0"
	.text
	.globl	_VerificaFimJogo
	.def	_VerificaFimJogo;	.scl	2;	.type	32;	.endef
_VerificaFimJogo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L3
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L3
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	je	L4
L3:
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L5
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L5
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	je	L4
L5:
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L6
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L6
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	je	L4
L6:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L7
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L7
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	je	L4
L7:
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L8
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L8
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	je	L4
L8:
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	jne	L9
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	jne	L9
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	je	L4
L9:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L10
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L10
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	je	L4
L10:
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$88, %al
	jne	L11
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$88, %al
	jne	L11
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$88, %al
	jne	L11
L4:
	movl	$LC3, (%esp)
	call	_puts
	movl	12(%ebp), %eax
	movl	$1, (%eax)
	jmp	L21
L11:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L13
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L13
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	je	L14
L13:
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L15
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L15
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	je	L14
L15:
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L16
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L16
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	je	L14
L16:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L17
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L17
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	je	L14
L17:
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L18
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L18
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	je	L14
L18:
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	jne	L19
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	jne	L19
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	je	L14
L19:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L20
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L20
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	je	L14
L20:
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	cmpb	$79, %al
	jne	L21
	movl	8(%ebp), %eax
	addl	$3, %eax
	movzbl	1(%eax), %eax
	cmpb	$79, %al
	jne	L21
	movl	8(%ebp), %eax
	addl	$6, %eax
	movzbl	(%eax), %eax
	cmpb	$79, %al
	jne	L21
L14:
	movl	$LC4, (%esp)
	call	_puts
	movl	12(%ebp), %eax
	movl	$1, (%eax)
L21:
	nop
	leave
	ret
	.section .rdata,"dr"
LC5:
	.ascii "Digite a linha: \0"
LC6:
	.ascii "%d\0"
LC7:
	.ascii "Digite a coluna: \0"
	.align 4
LC8:
	.ascii "\12 Jogada Invalida :( Tente outro lugar: \0"
	.text
	.globl	_Usuario
	.def	_Usuario;	.scl	2;	.type	32;	.endef
_Usuario:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$1, -12(%ebp)
	jmp	L23
L26:
	movl	$LC5, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	$LC7, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_scanf
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movzbl	(%edx,%eax), %eax
	cmpb	$32, %al
	jne	L24
	movl	-16(%ebp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	movb	$88, (%edx,%eax)
	movl	$0, -12(%ebp)
L24:
	cmpl	$1, -12(%ebp)
	jne	L23
	movl	$LC8, (%esp)
	call	_puts
L23:
	cmpl	$1, -12(%ebp)
	je	L26
	movl	12(%ebp), %eax
	movl	$1, (%eax)
	nop
	leave
	ret
	.globl	_Computador
	.def	_Computador;	.scl	2;	.type	32;	.endef
_Computador:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$1, -12(%ebp)
	jmp	L28
L29:
	call	_rand
	movl	%eax, %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -16(%ebp)
	call	_rand
	movl	%eax, %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	jne	L28
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movb	$79, (%eax)
	movl	$0, -12(%ebp)
L28:
	cmpl	$1, -12(%ebp)
	je	L29
	movl	12(%ebp), %eax
	movl	$0, (%eax)
	nop
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC9:
	.ascii "\12!!!FIM DE JOGO!!!\0"
LC10:
	.ascii "\12EMPATE\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$9, 8(%esp)
	movl	$32, 4(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_memset
	movl	$0, 28(%esp)
	movl	$0, 44(%esp)
	movl	$0, 24(%esp)
	jmp	L31
L34:
	movl	28(%esp), %eax
	testl	%eax, %eax
	jne	L32
	movl	24(%esp), %eax
	testl	%eax, %eax
	jne	L32
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_Tabuleiro
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_Usuario
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_VerificaFimJogo
L32:
	cmpl	$4, 44(%esp)
	je	L33
	movl	24(%esp), %eax
	testl	%eax, %eax
	jne	L33
	movl	28(%esp), %eax
	cmpl	$1, %eax
	jne	L33
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_Computador
	leal	24(%esp), %eax
	movl	%eax, 4(%esp)
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_VerificaFimJogo
L33:
	addl	$1, 44(%esp)
L31:
	cmpl	$4, 44(%esp)
	jle	L34
	movl	24(%esp), %eax
	cmpl	$1, %eax
	je	L35
	cmpl	$4, 44(%esp)
	jle	L36
L35:
	movl	$LC9, (%esp)
	call	_puts
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_Tabuleiro
	jmp	L37
L36:
	movl	$LC10, (%esp)
	call	_puts
	movl	$LC9, (%esp)
	call	_puts
	leal	35(%esp), %eax
	movl	%eax, (%esp)
	call	_Tabuleiro
L37:
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (tdm-1) 5.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_memset;	.scl	2;	.type	32;	.endef
