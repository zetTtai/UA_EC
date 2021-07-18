.data
A: .word 2, 4, 6, 8, 10 # vector A iniciado con valores
B: .word 0:5 # Vector B vacío
C: .space 50 # Otra definición de vector vacio(Reserva 50 bytes)
mensaje: .asciiz "Introduce un entero--> " 
n: .asciiz "\n" 

.text
la $s0, A # Dirección base del vector A
la $s1, B # Dirección base del vector B
la $s3, C # Dirección base del vector C
li $s5, 5 # Tamaño del vector
loop: 
la $a0, mensaje
li $v0, 4
syscall

la $v0, 5
syscall

move $t3, $v0 #Movemos a $t3 el valor introducido en $v0

la $a0, n
li $v0, 4
syscall

add $t1, $s0, $t0
add $t2, $s1, $t0
add $t6, $s3, $t0

lw $t4, 0($t1) #Guardamos el valor de la posición de A en $t4
add $t7, $t4, $t3

sw $t7, 0($t6)
	
addi $s2, $s2, 1 #Indice 0 1 2....
sll $t0, $s2, 2 # Índice del vector x4
bne $s2, $s5, loop #si no es igual a 5 lo repite

li $v0, 10
syscall
