#Escribe el código que lee dos enteros del teclado mostrando sendos mensajes por
#consola: uno que pida al usuario que introduzca el primer valor y tras haberlo
#leído que muestre otro solicitando el segundo valor. Los datos se almacenarán en
#la memoria, para lo cual debes haber reservado previamente espacio en el
#segmento de datos. Una vez almacenados los datos tienes que llamar a una
#función, que denominaremos SWAP, que intercambie el contenido de las dos
#posiciones de memoria. Para finalizar se leerán los valores guardados en la
#memoria y se mostrarán ordenados de menor a mayor en la pantalla.

.data
A: .word 0
B: .word 0
FRAS1: .asciiz "Introduce el primer valor: "
FRAS2:.asciiz "Introduce el segundo valor: "
RES1: .asciiz "A es mayor que B: "
RES2: .asciiz "B es mayor que A: "
n: .asciiz "\n" #Salto de línea
.text
	la $a0, FRAS1
	li $v0,4
		syscall
	li $v0,5 #Leer un entero
		syscall
	move $s0, $v0 #El valor de A está en $s0
	la $a0,n
	li $v0,4
		syscall
	la $a0,FRAS2
	li $v0,4
		syscall
	li $v0,5
		syscall
	move $s1, $v0 #El valor de B está en $s1
	la $a0,n
	li $v0,4
		syscall
	la $t0, A
	la $t1, B
	sw $s0,0($t0)#Copiamos el valor de $s0 en $t0(A)
	sw $s1,0($t1)#Copiamos el valor de $s1 en $t1(B)
	jal swap
	jal comparar
	
	li $v0, 10 #Finalizar programa
	
	
swap:	move $a0, $s0
	move $a1, $s1
	sw $a0,0($t1)#Copiamos el valor de $s1 en $t1(B) el valor de A
	sw $a1,0($t0)#Copiamos el valor de $s1 en $t0(A) el valor de B
	
	jr $ra

comparar:
	bgt $t1, $t0, else #Primero mayor que segundo B>A se activa else
	la $a0, RES2
	li $v0,4
		syscall
	move $a0, $t0
	li $v0, 11
		syscall
	jr $ra
	
else:
	la $a0, RES1
	li $v0,4
		syscall
	move $a0, $t1
	li $v0, 11
		syscall
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	