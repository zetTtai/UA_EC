.data 
 
cadena: .space 32 
 	.eqv ControlTeclado 0  
 	.eqv BufferTeclado 4  
 	.eqv ControlDisplay 8  
 	.eqv BufferDisplay 12 
 
.text    
la $a0,cadena  
jal read_string  
la $a0,cadena  
jal print_string       
li $v0,10  
syscall 
 
################################################################ 
print_string:  
	la $t0,0xFFFF0000 
sync: 
	lw $t1, ControlDisplay($t0)  
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
	la $t3, cadena
	li $t4, 0
loop:
	add $t5, $t3, $t4
	lui $t0, 0xffff #Dirección del regitro de control del teclado
	li $t1, 0 #Inicia el contador de espera
esperar:
	lw $t2, ($t0) #Lee Registro introducido por teclado
	andi $t2, $t2, 1 #Extrae el bit de ready
	addiu $t1, $t1, 1 #Aumentamos el contador
	
	beqz $t2, esperar #Si $t2 vale 0, no hay caracter sigue esperando
	lw $v0, 4($t0)
	
	move $a0, $v0
	sb $a0, 0($t5)
	addi $t4, $t4, 1
	bne $a0, 10, loop # El salto de linea equivale al 10
	#Ha introducido \n, acabamos el bucle
	jr $ra