#�Con qu� instrucciones traducir� el ensamblador las pseudoinstrucciones rol y ror?. 
#Escribe un c�digo sencillo de prueba de ambos operadores y ens�mblalos para comprobarlo.
.text 
	li $t1, 0xABCDABCD
	ror $t2, $t1, 4
#Se traduce por las reglas: sll, srl y or