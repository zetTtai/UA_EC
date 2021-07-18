.data
	matriz: .word 0:16
	fyc: .word 4
	long: .word 16
	aviso: .asciiz "Los datos de la matriz se introducen de izquierda a derecha, arriba hacia abajo"
	msg: .asciiz "Introduce el elemento de la matriz--> "
	fila: .asciiz "Se ha completado una fila"
	n: .asciiz "\n"
.text
la $s0, matriz
lw $s1, fyc
lw $s2, long#Guardamos la longitud del vector
li $t2, 0 #Iniciamos el contador a 0
li $t4, 0 #Iniciamos el indice que recorre las columnas a 0
	la $a0, aviso
	li $v0, 4
	syscall
	la $a0, n
	li $v0, 4
	syscall
	jal loop
	li $v0, 10
	syscall
loop: 
	jal escribir
	
	addi $t2, $t2, 1 #Aumentamos el contador
	addi $t4, $t4, 1
	addi $s0, $s0, 4
	beq $t4, $s1, fila_completa
	bne $t2, $s2, loop
	jr $ra
	
escribir:
	la $a0, msg
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	jr $ra
fila_completa:
	la $a0, fila
	li $v0, 4
	syscall
	la $a0, n
	li $v0, 4
	syscall
	li $t4, 0 #Reseteamos el valor que cuenta las columnas
	
	
	
	