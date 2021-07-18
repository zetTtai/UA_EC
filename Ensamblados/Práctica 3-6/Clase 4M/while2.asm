#En ejemplos como el anterior en el que sabemos que al menos el bucle se ejecuta
#una vez, es más eficiente poner la condición de salida del bucle al final del
#mismo. Reescribe el código anterior con la condición de salida al final del bucle
#(bucle del tipo do-while).
.text

	li $s0, 1 #Iniciamos contador
	li $s1, 11 #Condición de finalización
	li $s2,0 #Contador
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