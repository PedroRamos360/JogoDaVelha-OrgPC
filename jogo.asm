.data
	matriz:	.asciiz "         "
	jogadas: .word 0
	fimJogadas: .word 4
	comando: .word 0
	fimjogo: .word 0
	
	msgJogoVelha: .asciiz "\n\n#####JOGO DA VELHA#####\n\n"
	asciitabuleiro1: .asciiz "  "
	asciitabuleiro2: .asciiz "  |  "
	asciitabuleiro3: .asciiz "-----------------\n"
	newline: .asciiz "\n"
	
	digiteLinha: .asciiz "Digite a linha: "
	digiteColuna: .asciiz "Digite a coluna: "	

.text
	j main
	
	tabuleiro:
	
		li $v0, 4
		la $a0, msgJogoVelha # msg: "JOGO DA VELHA"
		syscall
		la $a0, asciitabuleiro1 #msg: "  "
		syscall

		la $a1, matriz
		lbu $a0, 0($a1)
		li $v0, 11
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 1($a1)
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 2($a1)
		syscall

		li $v0, 4
		la $a0, newline #msg: "\n"
		syscall

		la $a0, asciitabuleiro3 #msg: "-----------------\n"
		syscall

		la $a0, asciitabuleiro1 #msg: "  "
		syscall

		li $v0, 11
		lbu $a0, 3($a1)
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 4($a1)
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 5($a1)
		syscall

		li $v0, 4
		la $a0, newline #msg: "\n"
		syscall

		la $a0, asciitabuleiro3 #msg: "-----------------\n"
		syscall

		la $a0, asciitabuleiro1 #msg: "  "
		syscall

		li $v0, 11
		lbu $a0, 6($a1)
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 7($a1)
		syscall

		li $v0, 4
		la $a0, asciitabuleiro2 #msg: "  |  "
		syscall

		li $v0, 11
		lbu $a0, 8($a1)
		syscall

		li $v0, 4
		la $a0, newline #msg: "\n"
		syscall

		jr $ra
	usuario:
		# $t1 = linha $t2 = coluna $t3 = jogada
		li $t3, 1
		
		while_usuario:
			bne $t3, 1, fim_while
			li $v0, 4
			la $a0, digiteLinha
			syscall
			# scanf
			li $v0, 4
			la $a0, digiteColuna
			syscall
			li $t3, 0
		
		fim_while:
		
	
		jr $ra
	verificaFimJogo:
		jr $ra
	computador:
		jr $ra
	
	main:
		la $s7, matriz #carrega endereço da matriz no $s7
		while_jogadas:
			lw $t0, jogadas
			lw $t1, fimJogadas
			lw $t2, comando
			lw $t3, fimjogo
			
			bgt $t0, $t1, while_jogadas.end # Se jogadas > 4 sair do while
			
			beq $t2, 0, if_comando_fim_jogo # Se comando == 0 -> verificar fim de jogo
			j if_comando_fim_jogo.end # Se for falso pular instrução
			if_comando_fim_jogo:
				bne $t3, 0, if_comando_fim_jogo.end # Se fim jogo != 0 pular instruções
				jal tabuleiro
				jal usuario # pula pra função usuario
				jal verificaFimJogo # pula pra função verificarFimJogo
			if_comando_fim_jogo.end:
			
			#j whilejogadas

			
		while_jogadas.end:
		
			
	
