.data
matriz: .byte 4:4 #Vector vacio 4 x4

cf: .word 4 # Numero de columnas y filas
aviso: .asciiz "Los datos se introducen de izquierda a derecha, arriba hacia abajo"
mensaje: .asciiz "Introduce un entero --> "
fila: .asciiz "Fila completada"
n: .asciiz "\n"
.text
la $s0, matriz
lw $t3, cf
la $a0, aviso
li $v0, 4
syscall
loop:
	jal escribir
	sw $t5, 0($s0)
	
	addi $t2, $t2, 1 #Aumentamos en 1 el indice
	addi $t0, $t0, 1 #Aumentamos en 1 la columna
	addi $s0, $s0, 4
	bne $t2, $t3, loop #Si no son iguales vuelve al loop
	jal newline1
	jal leer
	li $v0, 10
	syscall
escribir:
	la $a0, n
	li $v0, 4
	syscall
	la $a0, mensaje
	li $v0, 4
	syscall
	la $v0, 5
	syscall
	move $t5, $v0 #Guardamos el valor introducido en $t5
	jr $ra
newline1:
	li $t2, 0
	la $a0, fila
	li $v0, 4
	syscall
	addi $t4, $t4, 1 #Aumentamos el indice de filas
	bne $t4, $t3, loop
	jr $ra
leer:
la $t0, matriz #Guardamos la dirección de la matriz
lw $t3, cf #Guardamos en $t3 el numero de columnas
li $t2, 0 #Iniciamos el indice que recorre las columnas a 0 
li $t4, 0 #Iniciamos el indice que recorre las filas a 0

loopl:
	lb $t1, 0($t0) #Fila 0
	move $a0, $t1
	jal imprimir
	addi $t2, $t2, 1 #Aumentamos en 1 el indice
	addi $t0, $t0, 1 #Aumentamos en 1 la columna
	bne $t2, $t3, loopl #Si no son iguales vuelve al loop
	jal newline2
	jr $ra
newline2:
	li $t2, 0
	li $a0, '\n'
	li $v0, 11
	syscall
	addi $t4, $t4, 1 #Aumentamos el indice de filas
	bne $t4, $t3, loopl
	jr $ra
imprimir:
	li, $v0, 1
	syscall   
	li $a0, '\t'   
	li $v0, 11  
	syscall   
	jr $ra 

