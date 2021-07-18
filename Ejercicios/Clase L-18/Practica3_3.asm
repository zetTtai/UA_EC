.text
	eti1: li $a0, '\n' #Salto de linea
	li $v0, 11
syscall
	li $v0, 12 #Leer el caracter
syscall
	move $t0, $v0 #Mover el valor de v0 a t0
	li $a0, '\n' #Salto de linea
	li $v0, 11
syscall
	move $a0, $t0
	addi $a0, $a0, -48
	li $v0, 1 #Imprimir entero
syscall
	j eti1