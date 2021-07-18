#Haz el código que lea dos enteros de la consola y escriba la suma y vuelva a
#comenzar si el resultado es distinto de 0. Es pseudocódigo sería:

.text
seguir:	li $a0, '\n'
	li $v0, 11 #Salto de linea
	syscall

	li $a0, '>'
	li $v0, 11 #Imprimir
	syscall
	li $v0, 5 #Leemos A
	syscall
	move $s0, $v0
	li $a0, '>'
	li $v0, 11 #Imprimir
	syscall
	li $v0, 5 #Leemos B
	syscall
	move $s1, $v0 
	add $a0, $s0, $s1
	li $v0, 1
	syscall
	
	beq $a0, $zero, acabar #Salta a acabar, porque vale 0
	bne $a0, $zero, seguir #Salta a seguir, poruqe no es 0
	
acabar: li $v0, 10 #Acabamos el programa