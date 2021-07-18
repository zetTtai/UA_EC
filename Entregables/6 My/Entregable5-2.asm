.data
cadena: .space 32
	.eqv ControlTeclado 0
	.eqv BufferTeclado 4
	.eqv ControlDisplay 8
	.eqv BufferDisplay 12
msg: .asciiz "Prueba1"
.text
la $a0,cadena
jal read_string
imprimir:
jal print_string
li $v0,10
syscall
################################################################
print_string:
la $t0,0xFFFF0000
sync: lw $t1, ControlDisplay($t0)
andi $t1,$t1,1
beqz $t1,sync
lbu $t1,0($a0)
beqz $t1,final
sw $t1, BufferDisplay($t0)
addi $a0,$a0,1
j sync
final:
jr $ra
################################################################
read_string:
	lui $t0, 0xffff # Direc. del registro de control del teclado     
    	li $t1, 0 #Inicia un contador de espera 
	jal getc #Leer un registro por teclado
	jal echo
	
j imprimir
getc:  
lw $t2, ($t0)    

#SINCRONIZACIÓN:   
andi $t2, $t2, 1 #Extrae el bit de ready     
addiu $t1, $t1, 1  #Incrementa el contador (cuenta las iteraciones)
beqz $t2, getc  # Si cero no hay carácter continuamos esperando   
		    
#TRANSFERENCIA:   
lw $v0, 4($t0)   #Lee registro de datos del teclado Codigo de tecla guardado en $v0
	jr $ra
echo:
	la $s1, '\n'
	beq $v0, $s1, imprimir
	sw $v0, 4($a0) #Como no es \n, lo guardamos en cadena($a0)
	addi $a0, $a0, 4
	j read_string
