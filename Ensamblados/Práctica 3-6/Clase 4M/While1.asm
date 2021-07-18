#Imprimir el valor de s2, con cada iteración
.text

	li $s0, 1 #Iniciamos contador
	li $s1, 11 #Condición de finalización
	li $s2,0 #Contador
inicio_for: 
	sle $t1, $s0, $s1
	beqz $t1, final_for
	add $s2, $s2, $s0 #cuerpo del bucle
	addi $s0, $s0, 1 #incremento del contador
	
	move $a0, $s2
	li $v0, 1
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	j inicio_for
	
final_for:
	li $v0, 10
	
