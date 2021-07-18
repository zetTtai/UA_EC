.data 
 	array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
 	long: .word 10  
 	suma :.word 0
 	
 	r.suma: .asciiz "La suma de los elementos es: "
 	r.media: .asciiz "Obtenemos un valor medio de: "
	n: .asciiz "\n"
.text
la $s0, array #Dirección del vector array
lw $s5, long #Guardamos en $s5 el tamaño del vector
add $s1, $zero, $zero #Iniciamos el contador a 0
li $t2, 0 #Iniciamos indice para recorrer el vector

loop:#Bucle para obtener la suma de los elementos del vector array
	beq $s1, $s5, exit #Si $s1 y $s5 son iguales salimos del bucle
	lw $t1, 0($s0)#Guardamos el valor del elemento en $t1

	add $s6, $s6, $t1#Sumamos
	
	addi $t2, $t2, 1 #Incremento índice
	addi $s1, $s1, 1 #Incrementamos el contador
	addi $s0,$s0,4 #Aumentamos 4 bytes la direccion para leer el siguiente valor
	j loop
exit:
	la $a0, r.suma
	li $v0, 4
	syscall
	move $a0, $s6#Imprimimos el valor de la suma obtenido después de acabar el bucle
	li $v0, 1
	syscall
	la $a0, n#Salto de linea
	li $v0, 4
	syscall
	jal avg #Llamamos a la función que usaremos para calcular el valor medio
	li $v0, 10#Acabamos el programa
	syscall
avg:
	mtc1 $s5, $f5
	mtc1 $s6, $f6
	cvt.s.w $f0, $f5#Guardamos en $f0 el valor de $s5, despues de convertirlo en entero
	cvt.s.w $f1, $f6#Guardamos en $f1 el valor de $s6, despues de convertirlo en entero
	la $a0, r.media
	li $v0, 4
	syscall
	div.s $f12, $f1, $f0
	li $v0, 2
	syscall
	jr $ra
	
	






	
