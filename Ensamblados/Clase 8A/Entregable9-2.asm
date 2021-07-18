 .data 
	Xpide:.asciiz "X = " 
	Npide:.asciiz "n = " 
	powRes: .asciiz "X^n = "  
.text 
la $a0, Xpide  
li $v0,4  
syscall  
li $v0,6  
syscall    

la $a0, Npide  
li $v0,4  
syscall  
li $v0,5  
syscall 
 
mov.s $f12,$f0  
move $a0,$v0  
jal pow    
la $a0,powRes  
li $v0,4  
syscall  
mov.s $f12,$f0  
li $v0,2  
syscall    
li $v0,10  
syscall   
 
pow:
	move $s1, $a0 #Movemos a $s1 para usarlo en el bucle(n veces)
	li $t0, 0 #Inicializamos a 0 el contador
	li $t5, 1 #Inicializamos a 1 la variable donde vamos a guardar las multis
	mtc1 $t5, $f5
	cvt.s.w $f5, $f5
	loop:
		mul.s $f5, $f5, $f0 #Multiplicamos X por si mismo y guardamos el resultado 
		#en $f5
	 	addi $t0, $t0, 1
	 	bne $t0, $s1, loop
	 	mov.s $f0, $f5
	jr $ra 