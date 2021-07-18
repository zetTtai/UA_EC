#Código ejemplo 1
#Acceso a la memoria. Lectura y escritura
.data #Definición segmento de datos
A: .word 25
B: .word 10
C: .word 0
.text #Comienza el programa
	la $t0,A
	la $t1,B
	la $t2,C
	lw $s0,0($t0) #Guarda en s0 el valor 25(A)
	lw $s1,0($t1) #Guarda en s1 el valor de 10(B)
	add $s2,$s1,$s0
	add $s2,$s2,$s2
	sw $s2,0($t2) #Copiar el valor de $s2 a $t2
	li $v0, 10 #Acaba el programa
	syscall

#¿Cuántos bytes de la memoria principal están ocupados por datos del programa?
#--> 4+4+4= 12

#¿Cuántas instrucciones de acceso a la memoria contiene el programa?
#--> 3

#¿Qué valor tiene el registro $t1 cuando se ejecuta la instrucción lw $s1,0($t1)?
#--> La dirección de B

#¿En qué dirección se almacena el resultado?
#--> En C

#Sustituid la instrucción sw $s2,0($t2) por sw $s2,2($t2) ¿Qué ocurre cuando se
#intenta ejecutar el programa? Razonad la respuesta
#--> Estamos cogiendo una palabra que no es multiplo de cuatro, así que da error

#¿Cuál es la codificación en lenguaje máquina de la instrucción lw $s1,0($t1)?
#Desglosa la instrucción en los distintos campos del formato.
#--> 0x8d310000== 10011 Cod operación
