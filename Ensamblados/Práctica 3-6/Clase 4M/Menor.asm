#La instrucción bltz (branch if less than zero) salta si el valor es menor que cero y
#es similar a bgez ya que también compara un registro con 0 pero siendo contraria
#la condición de salto. Cambiad la instrucción bgez por bltz, ¿Qué modificaciones
#tendríais que hacer en el código?

##Valor absoluto

.text
	li $a0, '>'
	li $v0,11 #Indicación de escribir un valor
syscall
	li $v0,5
syscall #Leer el entero A
	bltz $v0, else # Si (A < 0) salta a exit
	j exit #Acaba parte if-then
	
else: 	sub $a0, $zero, $v0 #Ahora el else resta
exit: 	li $v0, 1 #Imprimir lo que hay en $a0
	syscall
	li $v0, 10 #Acaba el programa
	syscall