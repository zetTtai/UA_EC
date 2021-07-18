.data
matriz: .byte 1, 4, 7, 5
 	      2, 5, 8, 6
     	      0, 6, 9, 7
     	      3, 5, 1, 5
filas: .word 4 # Numero de columnas
.text
leer:
la $t0, matriz #Guardamos la dirección de la matriz
lw $t3, filas #Guardamos en $t3 el numero de columnas
li $t2, 0 #Iniciamos el indice que recorre las columnas a 0 
li $t4, 0 #Iniciamos el indice que recorre las filas a 0

loop:
	lb $t1, 0($t0) #Fila 0
	move $a0, $t1
	jal imprimir
	addi $t2, $t2, 1 #Aumentamos en 1 el indice
	addi $t0, $t0, 1 #Aumentamos en 1 la columna
	bne $t2, $t3, loop #Si no son iguales vuelve al loop
	jal newline
	
	li $v0, 10
	syscall
imprimir:
	li, $v0, 1
	syscall   
	li $a0, '\t'   
	li $v0, 11  
	syscall   
	jr $ra 
newline:
	li $t2, 0
	li $a0, '\n'
	li $v0, 11
	syscall
	addi $t4, $t4, 1 #Aumentamos el indice de filas
	bne $t4, $t3, loop
	jr $ra