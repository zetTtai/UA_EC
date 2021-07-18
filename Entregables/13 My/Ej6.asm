# Reserva de espacio para guardar registros en kdata
.kdata
contexto: .word 0,0,0,0 # espacio para alojar cuatro registros
.ktext 0x80000180 # Direcci�n de comienzo de la rutina
# Guardar registros a utilizar en la rutina.
la $k1, contexto
sw $at, 0($k1) # Guardamos $at
sw $t0, 4($k1)
sw $v0, 8($k1)
sw $a0, 12($k1)
#Comprobaci�n de si se trata de una interrupci�n
mfc0 $k0, $13 # Registro Cause
srl $a0, $k0, 2 # Extraemos campo del c�digo
andi $a0, $a0, 0x1f
bne $a0, $zero, acabamos # S�lo procesamos aqu� E/S
#Tratamiento de la interrupci�n
li $t0, 0xffff0000 
lb $a0, 4($t0) # Lee car�cter del teclado
# Por ejemplo:
# Escribe en la consola del MARS el car�cter le�do
li $v0, 11
syscall
# Antes de acabar se podr�a dejar todo iniciado:
acabamos: mtc0 $0, $13 # Iniciar registro Cause
mfc0 $k0, $12 # Leer registre Status
andi $k0, 0xfffd # Iniciar bit de excepci�n
ori $k0, 0x11 # Habilitar interrupciones
mtc0 $k0, $12 # reescribir registre Startus
# Restaurar registros
lw $at, 0($k1) # Recupero $at
lw $t0, 4($k1)
lw $v0, 8($k1)
lw $a0, 12($k1)
# Devolver en el programa de usuario
eret

.data
	mensaje: .asciiz "Pulsa teclas: \n"
.text
lui $t0,0xffff # Dirige del registro de control
lw $t1,0($t0) # Registre de control del receptor
ori $t1,$t1,0x0002 # Habilitar interrupciones del teclado
sw $t1,0($t0) # Actualizamos registro de control

mfc0 $a0,$12 # leer registre Status
ori $a0, 0xff11 # Habilitar todas las interrupciones
mtc0 $a0, $12 # reescribir el registro status

la $a0, mensaje
li $v0, 4
syscall

inicio:
j inicio

	
	
