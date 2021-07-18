#Ensambla el programa y comprueba si el resultado es correcto.
#-->
#Imprimir matriz transpuesta
.data
matriz: .byte 1, 4, 7,
 	      2, 5, 8
     	      3, 6, 9
columnas: .word 3 # Numero de columnas
.text
la $t0, matriz
lw $t3, columnas
li $t2, 0 #iniciamos �ndice para recorrer matriz

bucle:
lb $t1, 0($t0) #Fila 0
move $a0, $t1
jal imprimir

lb $t1, 3($t0) #Fila 1 (1*3elementos)
move $a0, $t1
jal imprimir

lb $t1, 6($t0) #Fila 2 (2*3elementos)
move $a0, $t1
jal imprimir

jal nuevalin

addi $t2, $t2, 1 # incremento �ndice
addi $t0, $t0, 1 #nueva columna
bne $t2, $t3, bucle
li, $v0, 10
syscall

imprimir: li, $v0, 1
syscall
li $a0, '\t'
li $v0, 11
syscall
jr $ra
nuevalin: li $a0,'\n'
li, $v0, 11
syscall
jr $ra
