#Modifica el c�digo de tal manera que ahora lo que lea sea una cantidad de hora y
#muestre por consola la cantidad de segundos.
.text
li $a0, '>'
li $v0,11
syscall
li $v0,5
syscall #Leer un entero

move $a0, $v0 #par�metro a pasar en $a0
jal mult60 #llamamos a la funci�n mult60

move $a0, $v0 #par�metro a pasar en $a0
jal mult60 #llamamos a la funci�n mult60 otra vez 60x60

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

mult60: sll $v0, $a0, 5
	sll $t0, $a0, 4
	add $v0, $v0, $t0
	sll $t0, $a0, 3
	add $v0, $v0, $t0
	sll $t0, $a0, 2
	add $v0, $v0, $t0
jr $ra
