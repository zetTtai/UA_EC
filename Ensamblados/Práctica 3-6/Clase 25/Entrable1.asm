#Escribe el c�digo que lee el valor x y escribe por pantalla la soluci�n de la
#ecuaci�n: 5x^2 + 2x + 3.

.text
	li $a0, '>'
	li $v0,11
		syscall
	li $v0,5
		syscall #Leer un entero
	
	move $a0, $v0 #par�metro a pasar en $a0
	jal cuadrado #llamamos a la funci�n
	addi $t0, $0, 5 #Guardamos el valor en $t0
	mult $v0, $t0 #5x^2
	mflo $t0#Mover a $v0
	
	addi $t1, $0, 2 #Guardamos el valor en $t1
	mult $a0, $t1
	mflo $s0 #Guardamos el resultado de la multiplicaci�n en $s0
	
	add $k0, $t0, $s0# Hacemos 5x^2+2x
	add $v0, $k0, 3 #Guardamos en $v0
	
	move $a0, $v0
	jal imprim #Llamamos a la funci�n imprim
	li $v0,10 #Acaba el programa
		syscall
#---------------Funcions------------------#
imprim: 
	addi $v0,$0,1 #funci�n imprim
		syscall #Escribe el valor en $a0
	li $a0, '\n' #Salto de l�nia
	li $v0,11
		syscall
	jr $ra #Vuelve al programa principal

cuadrado: 
	mult $a0, $a0
	mflo $v0
	jr $ra
	
	