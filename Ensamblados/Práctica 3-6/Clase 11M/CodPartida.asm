#Codigo de partida
.data
A: .word 6
B: .word 8
C: .space 4
X: .byte 1
VAE1: .asciiz "Estructuras de los Computadores"
VAE2: .asciiz "Curso 2018-2019\n"
VAE3: .asciiz "\n El resultado de la suma es: "
.text
	la $a0,VAE1
	li $v0,4
		syscall
	li $a0,'\n'
	li $v0,11
		syscall
	la $a0,VAE2
	li $v0,4
		syscall
	la $a0,VAE3
	li $v0,4
		syscall
	la $t0,A # $t0 = &A
	lw $t1,0($t0) # $t1 = *$t0
	lw $t2,4($t0) # $t1 = *($t0+4)
	add $t3,$t1,$t2
	sw $t3,8($t0)
	move $a0, $t3
	addi $v0,$0,1
		syscall #Escribe un valor
	li $v0, 10 #Acaba el programa
		syscall
		
#Ensambla el c�digo y ejec�talo. �Qu� hace la funci�n 4 para la instrucci�n syscall?
#--> Imprime cadena de caracteres

#�Cu�l es la codificaci�n m�quina de la instrucci�n syscall? 
#-->0x00000c

#�En qu� direcci�n se guarda el resultado de la suma?
#--> 0x100100008

#
#-->

#
#-->


