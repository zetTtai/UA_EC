.text  
addi $v0,$0,5  #Funci�n 5, leer el n�mero  
syscall  #Valor le�do en $v0 

addi $a0,$v0,0 #Movemos el valor le�do a $a0 
addi $a0, $a0, 1
addi $v0,$0,1  #Funci�n 1, imprimir el n�mero
syscall  #Escribimos en consola $a0  

addi $v0,$0,10 #Funci�n 10, exit 
syscall  #Acaba el programa
