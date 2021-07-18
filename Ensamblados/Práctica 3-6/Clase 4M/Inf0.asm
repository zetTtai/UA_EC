#Haz que haya un bucle infinito que lea por
#teclado excepto en el caso de que se escriba 0, en el cual se saldrá del programa. 

.text
inicio:
	li $a0, '>'
	li $v0, 11 #Imprimir
	syscall
	li $v0, 5 #Leemos n
	syscall 
	
	move $s1, $v0 #Ahora s1 es v0
	li $s0, 1 #Iniciamos contador
	#li $s1, 11 Ya no hace falta
	li $s2, 0 #Contador
inicio_for: 
	
	add $s2, $s2, $s0 #cuerpo del bucle
	addi $s0, $s0, 1 #incremento del contador
	
	move $a0, $s2
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	sle $t1, $s0, $s1
	beqz $t1, final_for
	
	j inicio_for
	
final_for:
	li $v0, 10
final: bne $s1, $zero, inicio