.text
	li $v0, 12 #Leer el caracter
	syscall
	
	ori $a0, $v0, 0
	ori $v0, $0, 34
	syscall