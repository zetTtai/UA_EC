#Modif�calo ahora para tener una nueva funci�n mult10 que multiplique por 10.
#Comprobar que el resultado es correcto.

#Escribe una funci�n que multiplique por 60. Escribe el programa principal que
#ea una cantidad de minutos y devuelve por consola la cantidad en segundos.

# Multiplicaci�n por 10
.text
li $a0, '>'
li $v0,11
syscall
li $v0,5
syscall #Leer un entero
move $a0, $v0 #par�metro a pasar en $a0
jal mult10 #llamamos a la funci�n mult 10

move $a0, $v0
jal imprim #Llamamos a la funci�n imprim
li $v0,10 #Acaba el programa

move $a0, $v0 #par�metro a pasar en $a0
jal mult60 #llamamos a la funci�n mult60

move $a0, $v0
jal imprim #Llamamos a la funci�n imprim
li $v0,10 #Acaba el programa
syscall
#---------------Funcions------------------#
imprim: addi $v0,$0,1 #funci�n imprim
syscall #Escribe el valor en $a0
li $a0, '\n' #Salto de l�nia
li $v0,11
syscall
jr $ra #Vuelve al programa principal
mult10: sll $v0, $a0, 3 #Fucni�n para multiplicar por 5(2 elevado a 3 = 8)
	add $v0, $v0, $a0
	add $v0, $v0, $a0
	jr $ra
	
mult60: sll $v0, $a0, 5
	sll $t0, $a0, 4
	add $v0, $v0, $t0
	sll $t0, $a0, 3
	add $v0, $v0, $t0
	sll $t0, $a0, 2
	add $v0, $v0, $t0
jr $ra