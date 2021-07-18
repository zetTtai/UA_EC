#############################################################
	## �REA DE DATOS DE LA RUTINA DE TRATAMIENTO ##
#############################################################

.kdata
registros: .word 0,0,0,0 # Espacio para guardar 4 registros
mis1:.asciiz"\nExcepci� dirige err�nea ocurrida en la direcci�n:"
mis2:.asciiz "\nExcepci� desbordamiento ocurrida en la direcci�n: "
mis3:.asciiz "\nEn cualquier caso continuamos el programa...\n"

##############################################################
## EMPIEZA C�DIGO DE LA RUTINA DE TRATAMIENTO De EXCEPCIONES##
##############################################################
.ktext 0x80000180 # Direcci�n de comienzo de la rutina
# Salvar los registros a utilizar
la $k1, registros
sw $at, 0($k1) # Es importante guardar el registro $at
sw $v0, 4($k1)
sw $a0, 8($k1)
mfc0 $a0, $13 # $a0 <= registro Cause
andi $a0, $a0, 0x3C # extraemos en $a0 el c�digo de excepci�n
#Detectamos s�lo dos excpcions
li $s0, 0x0030 # c�digo Desbordamiento
li $s1, 0X0014 # c�digo error de direcci�n store
beq $a0, $s0, Desbordo
bne $a0, $s1, salida
la $a0, mis1
li $v0, 4
syscall
mfc0 $a0, $14 # $a0 <= EPC, donde ha ocurrido la excepci�n
li $v0, 34
syscall # Escribimos EPC en hexadecimal
Desbordo:
la $a0, mis2
li $v0, 4
syscall
mfc0 $a0, $14 # $a0 <= EPC, donde ha ocurrido la excepci�n
li $v0, 34
syscall # Escribimos EPC en hexadecimal
salida:
la $a0, mis3
li $v0, 4
syscall
#Restauramos los registros
la $k1, registros
lw $at, 0($k1)
lw $v0, 4($k1)
lw $a0, 8($k1)
#Iniciamos registro Vaddr del coprocesador 0
mtc0 $zero, $8
#C�mo se trata de excepciones se actualiza el registro EPC
mfc0 $k0, $14 # $k0 <= EPC
addiu $k0, $k0, 4 # Incremento de $k0 en 4
mtc0 $k0, $14 # Ahora EPC apunta a la siguiente instrucci�n

eret # Vuelve al programa de usuario

.text
li $t0, 0x7FFFFFFF
addiu $t1, $t0,1 #Se ignora el desbordamiento

addi $t2, $t0, 1 #Detecta el desbordamiento
