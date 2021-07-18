.text
	addi $v0,$0,5 #Función 5, Lee el número introducido en la consola
	syscall #Valor leído en $v0
	
	addi $a0,$v0,0 #Movemos el valor leído a $a0
	addi $v0,$0,35 #Función 35, para pasar a Binario
	syscall #Escribimos en consola $a0 