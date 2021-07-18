#Leer del teclado
#Carácter de entrada en $v0
#SELECCIÓN:
lui $t0, 0xffff0008 # Direc. del registro de control del teclado
li $t1, 0 #Inicia un contador de espera
inicio: #bucle inf
b_espera1:
lw $t2, ($t0) #Lee registro control del teclado
#SINCRONIZACIÓN:
andi $t2, $t2, 1 #Extrae el bit de ready
addiu $t1, $t1, 1 #Incrementa el contador
#(cuenta las iteraciones)
beqz $t2, b_espera1 # Si cero no hay carácter
#continuamos esperando
#TRANSFERENCIA:
lw $v0, 4($t0) #Lee registro de datos del teclado
#Codigo de tecla guardado en $v0
move $a0, $v0
#Escribir en la consola
#Carácter de salida en $a0
lui $t0,0xffff #ffff0000; SELECCIÓN
b_espera:
lw $t1,8($t0) #registre control
andi $t1,$t1,0x0001 #bit de ready SINCRONIZACIÓN
beq $t1,$0,b_espera
sw $a0,12($t0) # TRANSFERENCIA

j inicio
