#Escribe una funci�n con instrucciones suma que devuelve el cu�druplo del n�mero entero que se le pasa.
#Escribid el programa principal que lea el n�mero del teclado y escriba el cu�druplo en la consola aprovechando la funci�n imprim.

# Devuelve el cuadruplo
.text
	li $a0, '>' #Comienza programa principal
	li $v0,11
		syscall
	li $v0,5
		syscall #Leer un enter
	
	move $a0, $v0 #argumento a pasar en $a0
	jal cuadruple
	move $a0, $v0
	jal imprim #llamamos a la funci�n
		syscall
	li $v0,10 #Acaba el programa
		syscall
 #---------Funcions---------#
imprim: addi $v0,$0,1 #comienza la funci�n
		syscall #Escribe un valor
	li $a0, '\n' #Salto de l�nia
	li $v0,11
		syscall
	jr $ra #Vuelta al programa principal

cuadruple: 
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	jr $ra #Vuelta al programa principal

	