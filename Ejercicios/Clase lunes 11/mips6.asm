.text
# Programa ECO
	li $v0,12 #Funci�n 12. Read character
	syscall #Car�cter le�do en $v0
	
	move $a0,$v0 #Car�cter a escribir en $a0
	li $v0,11 #Funci�n 11. Print character
	syscall
	
	li $a0, '\n'
	li $v0, 11
	syscall

	li $v0, 10 #Funci�n 10. Acaba programa
	syscall