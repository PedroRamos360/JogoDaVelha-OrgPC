.data
	matriz:	.asciiz "         "
	jogadas: .word 0
	fimjogo: .word 0
	debug: .asciiz "\n DEBUG \n"
	
	msgJogoVelha: .asciiz "\n\n#####JOGO DA VELHA#####\n\n"
	asciitabuleiro1: .asciiz "  "
	asciitabuleiro2: .asciiz "  |  "
	asciitabuleiro3: .asciiz "-----------------\n"
	jogadorVence1: .asciiz "O jogador '"
	jogadorVence2: .asciiz "' venceu! "
	empate: .asciiz "Empate!"
	
	newline: .asciiz "\n"
	
	digitePos: .asciiz "Digite a posicao [0-8]: "
	
	wins: .word 0,1,2, 3,4,5, 6,7,8, 0,3,6, 1,4,7, 2,5,8, 0,4,8, 2,4,6

.text
# macros
.macro win
	# $t1 = i
	# $t2 = enderço de wins
	# $t6 = pos_atual wins
	# $t7 = wins na pos_atual
	# $s0 = index wins
	# $s1 = string na pos_atual
	# $s2 = char1 para comparar
	# $s3 = char2 para comparar
	# $s4 = posição para pegar do wins (bem confusa essa definição mas não sei outra)
	li $t1, 0
	la $t2, wins
	for_win:
		bge $t1, 8, for_win.end # if i >= 9 sair do for
		
		mul $t6, $t1, 12 # pegar posição atual no wins: i*3wins (12 porque é multiplicado por 4 por conta do tamanho de word)
		lw $s0, wins($t6) # pegar index wins
		
		add $s1, $s7, $s0 # colocar string na posição do index de wins
		lbu $s2, 0($s1) # carregar char da posição em s2
		
		addi $t6, $t6, 4
		lw  $s0, wins($t6) # pegar próximo index wins
		
		add $s1, $s7, $s0 # colocar string na  próxima posição do index de wins
		lbu $s3, 0($s1) # carregar próximo char da posição em s3
		
		beq $s2, 32, for_win.continue # if char1 == ' ' sair
		bne $s2, $s3, for_win.continue # if char1 != char2 sair
		
		addi $t6, $t6, 4
		lw  $s0, wins($t6) # pegar próximo index wins
		
		add $s1, $s7, $s0 # colocar string na  próxima posição do index de wins
		lbu $s3, 0($s1) # carregar próximo char da posição em s3
		
		bne $s2, $s3, for_win.continue # if char1 != char3 sair
		
		# se passar em todos os testes retorne 1 porque realmente houve vitória
		j return1
		
		for_win.continue:
		addi $t1, $t1, 1
		j for_win
	
	for_win.end:
	# se os testes forem falsos retorne 0
	j return0
	
	return1:
		li $v1, 1
		move $s6, $s2 # pega o valor do char que venceu e manda para o registrador $s6 para printar o vencedor
		j fim
	return0:
		li $v1, 0
		j fim
	
	fim:
.end_macro

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
		# $t3 = jogada
		# $t4 = posição na string
		# $t5 = string começando a partir da posição $t4
		li $t3, 1
		
		while_usuario:
			bne $t3, 1, while_usuario.end
			# "Digite a Posicao[0-8]: "
			li $v0, 4
			la $a0, digitePos
			syscall
			
			# scanf pos:
			li $v0, 5
			syscall
			move $t4, $v0
        		
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
		
	
		jr $ra
	verificaFimJogo:
		bne $v1, 1, volta # se fim jogo != 1 pular instruções
		
		li $v0, 4
		la $a0, jogadorVence1
		syscall
		
		li $v0, 11
		move $a0, $s6 # pega o conteúdo de $s6 (o char do vencedor) e põe em a0
		syscall
		
		li $v0, 4
		la $a0, jogadorVence2
		syscall
		
		li $t0, 1
		sw $t0, fimjogo
		
		j while_jogadas.end
		
		volta:
		jr $ra
		
	computador:
		# $t0 = char pra substituir na string jogador
		# $t4 = posição na string
		# $t5 = string começando a partir da posição $t4
		# $t3 = i
		li $t4, 0 # tenta inicialmente colocar na primeira posição da string
		
		# Opção 1 - Tentar vencer
		li $t3, 0
		for_vencerO:
			bge $t3, 9, for_vencerO.end
			
        		add $t5, $t3, $s7 # coloca string na posição do i
        		lbu $a0, 0($t5) # pega o char da pos i
        		bne $a0, 32, for_vencerO.continue # se char não for vazio continuar
        		# se não for vazio
        		li $t0, 'O' 
        		sb $t0, 0($t5) # armazenar char na pos i
        		win # verifica a vitória com o macro e armazena o resultado em $v1
        		beq $v1, 1, fim_computador # se ganhar terminar jogada
        			# se não ganhar resetar jogada
        		li $t0, ' '
        		sb $t0, 0($t5)
        			
        			
        		for_vencerO.continue:
        		addi $t3, $t3, 1
        		j for_vencerO
		for_vencerO.end:

		# Opção 2 - Impedir jogador de vencer
		li $t3, 0
		for_vencerX:
			bge $t3, 9, for_vencerX.end
			
        		add $t5, $t3, $s7 # coloca string na posição do i
        		lbu $a0, 0($t5) # pega o char da pos i
        		bne $a0, 32, for_vencerX.continue # se char não for vazio continuar
        		# se não for vazio
        		li $t0, 'X' # testa se há vitória com o X
        		sb $t0, 0($t5) # armazenar char na pos i
        		win # verifica a vitória com o macro e armazena o resultado em $v1
        		
        		li $t0, 'O' # coloca o O no lugar do X para impedir vitória
        		sb $t0, 0($t5) # armazenar char na pos i
        		beq $v1, 1, fim_computador # se ganhar terminar jogada
        		# se não ganhar resetar jogada
        		li $t0, ' '
        		sb $t0, 0($t5)
        			
        			
        		for_vencerX.continue:
        		addi $t3, $t3, 1
        		j for_vencerX
		for_vencerX.end:
			
        	# Opção 3 - Marcar aleatoriamente
        	aleatorio:
        	li $v0, 42  
		li $a1, 9 
		syscall 
		move $t4, $a0
        		
        	add $t5, $t4, $s7
        	lbu $a0, 0($t5)
        		
        	beq $a0, 32, if_posicao_marcada_vazia2
        	j if_posicao_marcada_vazia.end2
        		
        	if_posicao_marcada_vazia2:
        		li $t0, 'O'
        		sb $t0, 0($t5)
        		j fim_computador
		if_posicao_marcada_vazia.end2:    			
			
		j aleatorio
			
		
		fim_computador:
	
	
		jr $ra
	
	main:
		# $s7 = endereço da matriz
		la $s7, matriz
		li $a3, 0
		while_jogadas:
			lw $t3, fimjogo
			
			bgt $a3, 4, jogoEmpatado # Se jogadas > 4 sair do while
			bne $t3, 0, while_jogadas.end # Se fim jogo != 0 finalizar programa
			
			jal tabuleiro
			
			if_comando_fim_jogo:
				bne $t3, 0, while_jogadas.end # Se fim jogo != 0 finalizar programa
				jal usuario
				jal tabuleiro
				win
				jal verificaFimJogo
			if_comando_fim_jogo.end:
			
			bne $a3, 4, if_jogadas_fim_jogo # Se jogadas != 4 -> entrar no if
			j if_jogadas_fim_jogo.end # Se for falso pular if
			
			if_jogadas_fim_jogo:
				bne $t3, 0, while_jogadas.end # Se fim jogo != 0 finalizar programa
				jal computador
				jal tabuleiro
				win
				jal verificaFimJogo
			
			if_jogadas_fim_jogo.end:
			
			addi $a3, $a3, 1
			
			j while_jogadas
			# empate
			jogoEmpatado:
			li $v0, 4
			la $a0, empate
			syscall
			
			
		while_jogadas.end:
