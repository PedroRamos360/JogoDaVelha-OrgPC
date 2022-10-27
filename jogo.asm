.data
	matriz:	.byte ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
	jogadas: .word 0
	fimJogadas: .word 4
	comando: .byte 0
	fimjogo: .byte 0

.text
	j main
	
	tabuleiro:
	verificaFimJogo:
	usuario:
	computador:
	
	main:
		whilejogadas:
			lw $t0, jogadas
			lw $t1, fimJogadas
			lw $t2, comando
			lw $t3, fimjogo
			
			bgt $t0, $t1, whilejogadas.end # Se jogadas > 4 sair do while
			
		whilejogadas.end:
		
			
	
