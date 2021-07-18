#Modifica el código de tal manera que ahora lo que lea sea una cantidad de hora y
#muestre por consola la cantidad de segundos.
.text
li $a0, '>'
li $v0,11
syscall
li $v0,5
syscall #Leer un entero

move $a0, $v0 #parámetro a pasar en $a0
jal mult60 #llamamos a la función mult60

move $a0, $v0 #parámetro a pasar en $a0
jal mult60 #llamamos a la función mult60 otra vez 60x60

move $a0, $v0
jal imprim #Llamamos a la función imprim
li $v0,10 #Acaba el programa
syscall
#---------------Funcions------------------#
imprim: addi $v0,$0,1 #función imprim
syscall #Escribe el valor en $a0
li $a0, '\n' #Salto de línia
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
