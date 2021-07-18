.data
	matriz: .word 0:16 #Vector vacio con 16 de capacidad
	cf: .word 4 # Numero de columnas y filas
	long: .word 16 #Longitud del vector
	aviso: .asciiz "Los datos se introducen de izquierda a derecha, arriba hacia abajo"
	mensaje: .asciiz "Introduce un entero --> "
	fila: .asciiz "Fila completada"
	resultado: .asciiz "La suma de los elementos de la diagonal principal introducida es: "
	n: .asciiz "\n"
	diagonal: .asciiz "Teniendo como diagonal principal: "
.text
la $s0, matriz
lw $t0, cf
lw $t3, long
li $t2,0 #Contador iniciado a 0
li $t4,0 #Contador de columnas
la $a0, aviso
li $v0, 4
syscall
la $a0, n
li $v0, 4
syscall
loop:   jal escribir
	sw $t5, 0($s0)
	addi $t2, $t2, 1 #Aumentamos en 1 el indice
	addi $t4, $t4, 1 #Aumentamos el contador de las columnas
	addi $s0, $s0, 4
	beq $t4, $t0, fila_completa
	bne $t2, $t3, loop #Si no son iguales vuelve al loop
	jal exit
escribir:
	la $a0, mensaje
	li $v0, 4
	syscall
	la $v0, 5
	syscall
	move $t5, $v0 #Guardamos el valor introducido en $t5
	jr $ra
fila_completa:
	la $a0, fila
	li $v0, 4
	syscall
	la $a0, n
	li $v0, 4
	syscall
	li $t4, 0 #Reseteamos el valor de $t4
	bne $t2, $t3, loop
exit:
la $t0, matriz #Guardamos la dirección de la matriz
lw $t3, long #Guardamos en $t3 el numero de columnas
li $t2, 0 
li $t5, 0
li $s1, 1
li $s2, 6
li $s3, 11
li $s4, 16
	la $a0, diagonal
	li $v0, 4
	syscall
	suma:
	lw $t1, 0($t0)
	move $a0, $t1
	addi $t2, $t2, 1 #Aumentamos en 1 el contador
	addi $t5, $t5, 1
	addi $t0, $t0, 4
	beq $t2, $s1, op
	beq $t2, $s2, op
	beq $t2, $s3, op
	beq $t2, $s4, op
	bne $t2, $t3, suma #Si no son iguales vuelve al loop
	jal res
	li $v0, 10
	syscall
op:
	add $t9, $t9, $t1 #Guardamos la suma de la diagonal en t9
	move $a0, $t1
	jal imprimir
	bne $t2, $t3, suma
res:
	la $a0, n
	li $v0, 4
	syscall
	la $a0, resultado
	li $v0, 4
	syscall
	move $a0, $t9
	li $v0, 1
	syscall 
	li $v0, 10
	syscall
imprimir:
	move $a0, $t1
	li, $v0, 1
	syscall   
	li $a0, ' '  
	li $v0, 11  
	syscall   
	jr $ra 
