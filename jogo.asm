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
		# $t0 = char pra substituir na string
		# $t1 = linha 
		# $t2 = coluna 
		# $t3 = jogada
		# $t4 = posição na string
		# $t5 = string começando a partir da posição $t4
		li $t3, 1
		
		while_usuario:
			bne $t3, 1, while_usuario.end
			# "Digite a Linha: "
			li $v0, 4
			la $a0, digiteLinha
			syscall
			
			# scanf linha:
			li $v0, 5
			syscall
			move $t1, $v0
			
			# "Digite a Coluna: "
			li $v0, 4
			la $a0, digiteColuna
			syscall
			
			# scanf coluna:
			li $v0, 5
			syscall
			move $t2, $v0
			
        		# transforma informação linha coluna em uma posição na string
        		mul $t4, $t1, 3 # multiplica linha por 3 e guarda em $t4
        		add $t4, $t4, $t2 # soma o resultado com o número de colunas
        		
        		add $t5, $t4, $s7
        		lbu $a0, 0($t5)
        		
        		beq $a0, 32, if_posicao_marcada_vazia1
        		j if_posicao_marcada_vazia.end1
        		
        		if_posicao_marcada_vazia1:
        			li $t0, 'X'
        			sb $t0, 0($t5)
        			li $t3, 0
			if_posicao_marcada_vazia.end1:       			
        		
			
			j while_usuario
			
		
		while_usuario.end:
		# *comando = 1
		li $t0, 1
		sw $t0, comando
		
	
		jr $ra
	verificaFimJogo:
		jr $ra
	computador:
		# $t0 = char pra substituir na string 
		# $t3 = jogador
		# $t4 = posição na string
		# $t5 = string começando a partir da posição $t4
		li $t3, 1
		li $t4, 0 # tenta inicialmente colocar na primeira posição da string
		
		while_computador:
			bne $t3, 1, while_computador.end
        		
        		add $t5, $t4, $s7
        		lbu $a0, 0($t5)
        		
        		beq $a0, 32, if_posicao_marcada_vazia2
        		j if_posicao_marcada_vazia.end2
        		
        		if_posicao_marcada_vazia2:
        			li $t0, 'O'
        			sb $t0, 0($t5)
        			li $t3, 0
			if_posicao_marcada_vazia.end2:
			
			# Caso não esteja vazia adiciona 1 a $t4 para tentar próxima posição
			addi $t4, $t4, 1       			
        		
			
			j while_computador
			
		
		while_computador.end:
		# *comando = 0
		li $t0, 0
		sw $t0, comando
	
	
		jr $ra
	
	main:
		# $s7 = endereço da matriz
		la $s7, matriz
		while_jogadas:
			lw $t0, jogadas
			lw $t1, fimJogadas
			lw $t2, comando
			lw $t3, fimjogo
			
			bgt $t0, $t1, while_jogadas.end # Se jogadas > 4 sair do while
			
			beq $t2, 0, if_comando_fim_jogo # Se comando == 0 -> entrar no if
			j if_comando_fim_jogo.end # Se for falso pular instrução
			
			if_comando_fim_jogo:
				bne $t3, 0, if_comando_fim_jogo.end # Se fim jogo != 0 pular instruções
				jal tabuleiro
				jal usuario # pula pra função usuario
				jal verificaFimJogo # pula pra função verificarFimJogo
			if_comando_fim_jogo.end:
			
			bne $t0, 4, if_jogadas_fim_jogo # Se jogadas != 4 -> entrar no if
			j if_jogadas_fim_jogo.end # Se for falso pular if
			
			if_jogadas_fim_jogo:
				bne $t3, 0, if_jogadas_fim_jogo.end # Se fim jogo != 0 pular instruções
				jal computador
				jal verificaFimJogo
				
			
			if_jogadas_fim_jogo.end:
			
			
			
			
			
			j while_jogadas

			
		while_jogadas.end:
