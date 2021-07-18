#Escribid el programa que lea dos enteros del teclado y escriba en la consola el
#mayor. La estructura será:

.text
	li $a0, '>'
	li $v0, 11 #Imprimir
	syscall
	li $v0, 5 #Leemos el entero A
	syscall
	move $s0, $v0
	li $a0, '>'
	li $v0, 11 #Imprimimos >
	syscall
	li $v0, 5 #Leemos el entero B
	syscall
	move $s1, $v0
	
	slt $t0, $s0, $s1 #Comparamos 
	beq $t0, $0, s0_Mayor
	
	move $a0, $s1
	
	j imprime
s0_Mayor:	move $a0, $s0

imprime:	li $v0, 1
		syscall
	

	
	
