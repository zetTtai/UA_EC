.data
vector: .word -4, 5, 8, -1
msg1: .asciiz "\n La suma de los valores positivos es = "
msg2: .asciiz "\n La suma de los valores negativos es = "
pos: .asciiz "Es positivo "
nega: .asciiz "Es negativo "
n: .asciiz "\n"
.text
la $a0, vector # dirección del vector como parámetro
li $a1, 4 # Longitud del vector como parámetro
#En a1 tenemos la longitud del vector
	move $s0, $a0
	add $s1, $zero, $zero #Iniciamos el contador a 0
	li $t2, 0 #Iniciamos el índice a 0
	loop:
		beq $s1, $a1, exit #Mientras $s1 y $a1 sean distintos el bucle continuará
		lw $t1, 0($s0)#Guardamos el valor del elemento en $t1
		slt $t0, $t1,$zero #Comparamos si $t1 es menor que 0
		beq $t0, $zero, positivo #Salta a positivo si $t0 vale 0
		
		la $a0, nega
		li $v0, 4
		syscall
		add $s6, $s6, $t1#Sumamos los negativos
		
		addi $t2, $t2, 1 #Incremento índice
		addi $s1, $s1, 1 #Incrementamos el contador
		addi $s0, $s0, 4 #Incrementamos la dirección del vector en 4 bytes
	j loop
	exit:
		la $a0, msg1
		li $v0, 4
		syscall
		move $a0, $s5
		li $v0, 1#Imprimimos suma de positivos
		syscall
		la $a0, msg2
		li $v0, 4
		syscall
		move $a0, $s6
		li $v0, 1#Imprimimos suma de negativos
		syscall
		li $v0, 10
		syscall
positivo: 
	la $a0, pos
	li $v0, 4
	syscall
	add $s5, $s5, $t1#Sumamos los positivos
	
	addi $t2, $t2, 1 #Incremento índice
	addi $s1, $s1, 1 #Incrementamos el contador
	addi $s0, $s0, 4 #Incrementamos la dirección del vector en 4 bytes
	j loop#Volvemos al bucle