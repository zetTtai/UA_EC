#Escribe una función con instrucciones suma que devuelve el cuádruplo del número entero que se le pasa.
#Escribid el programa principal que lea el número del teclado y escriba el cuádruplo en la consola aprovechando la función imprim.

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
	jal imprim #llamamos a la función
		syscall
	li $v0,10 #Acaba el programa
		syscall
 #---------Funcions---------#
imprim: addi $v0,$0,1 #comienza la función
		syscall #Escribe un valor
	li $a0, '\n' #Salto de línia
	li $v0,11
		syscall
	jr $ra #Vuelta al programa principal

cuadruple: 
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	add $v0, $a0, $a0
	jr $ra #Vuelta al programa principal

	