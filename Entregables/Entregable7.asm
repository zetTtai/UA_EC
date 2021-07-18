.data
vector: .word -4, 5, 8, -1
msg1: .asciiz "\n La suma de los valores positivos es = "
msg2: .asciiz "\n La suma de los valores negativos es = "
.text
Principal:
li $v0, 4 # Funci�n para imprimir string
la $a0, msg1 # Leer la direcci�n de msg1
syscall

la $a0, vector # direcci�n del vector como par�metro
li $a1, 4 # Longitud del vector como par�metro

jal sum # Llamada a la funci�n sum

move $a0, $v0 # Resultado 1 de la funci�n
li $v0, 1
syscall # Imprimir suma positivos

li $v0, 4
la $a0, msg2 
syscall

li $v0, 1
move $a0, $v1 # Resultado 2 de la funci�n
syscall # imprimir suma negativos

li $v0, 10 # Acabar programa
syscall
sum:
	add $v0, $zero, $zero#Reseteamos el valor de $v0 a 0
	move $s0, $a0#Guardamos en $s0 la direcci�n del vector
	add $s1, $zero, $zero #Iniciamos el contador a 0
	li $t2, 0 #Iniciamos el �ndice a 0
	loop:
		beq $s1, $a1, exit #Mientras $s1 y $a1 sean distintos el bucle continuar�
		lw $t1, 0($s0)#Guardamos el valor del elemento en $t1
		slt $t0, $t1,$zero #Comparamos si $t1 es menor que 0
		beq $t0, $zero, positivo #Salta a positivo si $t0 vale 0
		
		add $v1, $v1, $t1#Sumamos los negativos
		
		addi $t2, $t2, 1 #Incremento �ndice
		addi $s1, $s1, 1 #Incrementamos el contador
		addi $s0, $s0, 4 #Incrementamos la direcci�n del vector en 4 bytes
		j loop		
	exit:
		jr $ra
positivo: 
	add $v0, $v0, $t1#Sumamos los positivos
	
	addi $t2, $t2, 1 #Incremento �ndice
	addi $s1, $s1, 1 #Incrementamos el contador
	addi $s0, $s0, 4 #Incrementamos la direcci�n del vector en 4 bytes
	j loop#Volvemos al bucle