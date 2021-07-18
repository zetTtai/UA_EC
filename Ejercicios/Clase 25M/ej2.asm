#Ejemplo: recorrer un vector de enteros?
.data
A: .word 2, 4, 6, 8, 10 # vector A iniciado con valores
B: .word 0:5 # Vector B vacío
C: .space 50 # Otra definición de vector vacio(Reserva 50 bytes)

.text
la $s0, A # Dirección base del vector A
la $s1, B # Dirección base del vector B
li $s5, 5 # Tamaño del vector
loop: 
add $t1, $s0, $t0
add $t2, $s1, $t0
addi $s2, $s2, 1 # Índice del vector
	
lw $t3, 0($t1)
sw $t3, 0($t2)
	
sll $t0, $s2, 2 # Índice del vector x4
bne $s2, $s5, loop #si no es igual a 5 lo repite

li $v0, 10
syscall



#Completa el programa para que se rellene el vector C con la suma de los
#elementos del vector A y del B (C[y]=A[y]+B[y]).
#-->
