	#Leer del teclado   
	#Car�cter de entrada en $v0 
 
#SELECCI�N: 
     lui $t0, 0xffff # Direc. del registro de control del teclado     
     li $t1, 0 #Inicia un contador de espera  
     
inicio: 
b_espera:   
#lw $t2, ($t0)     #Lee registro control del teclado     

#SINCRONIZACI�N:   
andi $t2, $t2, 1 #Extrae el bit de ready     
addiu $t1, $t1, 1  #Incrementa el contador (cuenta las iteraciones)
beqz $t2, b_espera  # Si cero no hay car�cter continuamos esperando   
		    
#TRANSFERENCIA:   
lw $v0, 4($t0)   #Lee registro de datos del teclado 
                 #Codigo de tecla guardado en $v0
j inicio
