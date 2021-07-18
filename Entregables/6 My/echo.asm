.text
main:
	lui $t0, 0xffff # Direc. del registro de control del teclado     
    	li $t1, 0 #Inicia un contador de espera 
	jal getc #Leer un registro por teclado
	move $a0, $v0
	jal putc #Mostrar un registro leido
	j echo
	j main
end:
	li $v0,10
	syscall
	
getc:  
lw $t2, ($t0)    

#SINCRONIZACIÓN:   
andi $t2, $t2, 1 #Extrae el bit de ready     
addiu $t1, $t1, 1  #Incrementa el contador (cuenta las iteraciones)
beqz $t2, getc  # Si cero no hay carácter continuamos esperando   
		    
#TRANSFERENCIA:   
lw $v0, 4($t0)   #Lee registro de datos del teclado Codigo de tecla guardado en $v0
	jr $ra
putc:
lw $t1,8($t0) #registre control
andi $t1,$t1,0x0001 #bit de ready SINCRONIZACIÓN
beq $t1,$0,putc
sw $a0,12($t0) # TRANSFERENCIA
	jr $ra
echo:
	la $s1, '\n'
	beq $a0, $s1, end
	j main