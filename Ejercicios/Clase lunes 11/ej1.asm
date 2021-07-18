.text  
addi $v0,$0,5  #Función 5, leer el número  
syscall  #Valor leído en $v0 

addi $a0,$v0,0 #Movemos el valor leído a $a0 
addi $a0, $a0, 1
addi $v0,$0,1  #Función 1, imprimir el número
syscall  #Escribimos en consola $a0  

addi $v0,$0,10 #Función 10, exit 
syscall  #Acaba el programa
