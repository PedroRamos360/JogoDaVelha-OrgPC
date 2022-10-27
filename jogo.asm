.data
	matriz:	.byte ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
	jogadas: .word 0
	fimJogadas: .word 4
	comando: .word 0
	fimjogo: .word 0
	
	msgJogoVelha: .asciiz "\n\n#####JOGO DA VELHA#####\n\n"
	asciitabuleiro1: .asciiz "     |     |     \n"
	asciitabuleiro2: .asciiz "-----------------\n"	

.text
	j main
	
	tabuleiro:
		li $v0, 4
		la $a0, msgJogoVelha
		syscall
		la $a0, asciitabuleiro1
		syscall
		la $a0, asciitabuleiro2
		syscall
		la $a0, asciitabuleiro1
		syscall
		la $a0, asciitabuleiro2
		syscall
		la $a0, asciitabuleiro1
		syscall
		j fimTabuleiro
	usuario:
		j fimUsuario
	verificaFimJogo:
		j vfimjogo.end
	computador:
	
	main:
		whilejogadas:
			lw $t0, jogadas
			lw $t1, fimJogadas
			lw $t2, comando
			lw $t3, fimjogo
			
			bgt $t0, $t1, whilejogadas.end # Se jogadas > 4 sair do while
			
			beq $t2, 0, vfimjogo # Se comando == 0 -> verificar fim de jogo
			j vfimjogo.end # Se for falso pular instrução
			vfimjogo:
				beq $t3, 0, tabuleiro # Se fim jogo == 0 também, pular para função tabuleiro
				fimTabuleiro: # marca pra onde a função tabuleiro tem que retornar
				j usuario # pula pra função usuario
				fimUsuario: # marca fim da função usuário
				j verificaFimJogo # pula pra função verificarFimJogo
			vfimjogo.end:
			
			#j whilejogadas
			
		whilejogadas.end:
		
			
	
