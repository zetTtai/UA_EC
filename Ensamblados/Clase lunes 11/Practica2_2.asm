.text
	addi $v0,$0,5 #Funci�n 5, Lee el n�mero introducido en la consola
	syscall #Valor le�do en $v0
	
	addi $a0,$v0,0 #Movemos el valor le�do a $a0
	addi $v0,$0,35 #Funci�n 35, para pasar a Binario
	syscall #Escribimos en consola $a0 