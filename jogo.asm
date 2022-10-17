j main

.data

matriz:	.space 9

.text

.eqv fim_loop 9
.eqv spacechr 32

loop:
loop.strt:
loop.end:
	addiu $t1, $zero, spacechr
	addiu $t2, $zero, 0
	addiu $t3, $zero, 9
	sb $t1, matriz($t2)
	addiu $t1, $t1, 1
	blt $t2, $t3, loop
	jr $ra
exit:

main:
	la $t0, matriz
	jal loop
	
