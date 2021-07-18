.data
A: .word 2, 4, 6, 8, 10 # vector A iniciado con valores
B: .word 0:5 # Vector B vac�o
C: .space 50 # Otra definici�n de vector vacio(Reserva 50 bytes)
mensaje: .asciiz "Introduce un entero--> " 
n: .asciiz "\n" 

.text
la $s0, A # Direcci�n base del vector A
la $s1, B # Direcci�n base del vector B
li $s5, 5 # Tama�o del vector

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
addi $s2, $s2, 1 # �ndice del vector
	
#lw $t3, 0($t1) No hace falta los valores de A
sw $t3, 0($t2)
	
sll $t0, $s2, 2 # �ndice del vector x4
bne $s2, $s5, loop #si no es igual a 5 lo repite

li $v0, 10
syscall
