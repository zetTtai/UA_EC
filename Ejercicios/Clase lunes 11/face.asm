.text
	or $t2, $t1, $0 #Copio t1 en t2
	ori $t2, $t2, 0x000000F0 #t2 FAFE
	andi $t2, $t2, 0x0000CFFF #Cambio F por C
	
