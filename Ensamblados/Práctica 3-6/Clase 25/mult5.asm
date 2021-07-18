#Modifica el código en el que ahora haya una función multi5 que multiplique por
#5 y muestre el resultado por consola. Comprobar que el resultado es correcto

# Multiplicación por 5
.text
li $a0, '>'
li $v0,11
syscall
li $v0,5
syscall #Leer un entero
move $a0, $v0 #parámetro a pasar en $a0
jal mult5 #llamamos a la función mult4
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
mult5: sll $v0, $a0, 2 #Fucnión para multiplicar por 5
	add $v0, $v0, $a0
	jr $ra