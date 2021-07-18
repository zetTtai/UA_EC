#¿Con qué instrucciones traducirá el ensamblador las pseudoinstrucciones rol y ror?. 
#Escribe un código sencillo de prueba de ambos operadores y ensámblalos para comprobarlo.
.text 
	li $t1, 0xABCDABCD
	ror $t2, $t1, 4
#Se traduce por las reglas: sll, srl y or