#Descubre la palabra escondida
#Dado el siguiente código, complétalo de tal manera que mediante instrucciones lógicas y 
#de desplazamientos puedas escribir en la consola cada uno de los caracteres que se encuentran almacenados en cada
#byte del registre $t1.

#Palabra escondida
li $t1, 1215261793 #0012 1526 1793

move $t2, $t1
srl $t2, $t2, 24 #Desplazar 24 bits
andi $t2, $t2, 0x00000000FF
move $a0, $t2
li $v0, 11
syscall

move $t2, $t1
srl $t2, $t2, 16 #Desplazar 16 bits
andi $t2, $t2, 0x00000000FF
move $a0, $t2
li $v0, 11
syscall

move $t2, $t1
srl $t2, $t2, 8 #Desplazar 8 bits a la derecha
andi $t2, $t2, 0x00000000FF
move $a0, $t2
li $v0, 11
syscall

move $t2, $t1
#No hay que rotarlo
andi $t2, $t2, 0x00000000FF
move $a0, $t2
syscall

li $v0, 10 #Acaba el programa
syscall