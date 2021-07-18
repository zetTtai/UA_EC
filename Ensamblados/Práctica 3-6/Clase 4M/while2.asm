#En ejemplos como el anterior en el que sabemos que al menos el bucle se ejecuta
#una vez, es m�s eficiente poner la condici�n de salida del bucle al final del
#mismo. Reescribe el c�digo anterior con la condici�n de salida al final del bucle
#(bucle del tipo do-while).
.text

	li $s0, 1 #Iniciamos contador
	li $s1, 11 #Condici�n de finalizaci�n
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