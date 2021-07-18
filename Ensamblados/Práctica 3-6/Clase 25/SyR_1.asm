#Escribe la función que multiplique por la constante 11 según el algoritmo de
#Booth y comprueba que el resultado es correcto. 
#Multiplicar por 11
.text
li $a0, 'Valor de x -->'
li $v0,11
syscall
li $v0,5
syscall #Leer un entero

move $a0, $v0 #parámetro a pasar en $a0
jal mult11 #llamamos a la función mult11

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

mult11: sll $t0, $a0, 4
	sll $t1, $a0, 3
	sub $v0, $t0, $t1 #Restar
	sll $t0, $a0, 2
	add $v0, $v0, $t0
	sub $v0, $v0, $a0
jr $ra
