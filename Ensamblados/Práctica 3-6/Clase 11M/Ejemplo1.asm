#C�digo ejemplo 1
#Acceso a la memoria. Lectura y escritura
.data #Definici�n segmento de datos
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

#�Cu�ntos bytes de la memoria principal est�n ocupados por datos del programa?
#--> 4+4+4= 12

#�Cu�ntas instrucciones de acceso a la memoria contiene el programa?
#--> 3

#�Qu� valor tiene el registro $t1 cuando se ejecuta la instrucci�n lw $s1,0($t1)?
#--> La direcci�n de B

#�En qu� direcci�n se almacena el resultado?
#--> En C

#Sustituid la instrucci�n sw $s2,0($t2) por sw $s2,2($t2) �Qu� ocurre cuando se
#intenta ejecutar el programa? Razonad la respuesta
#--> Estamos cogiendo una palabra que no es multiplo de cuatro, as� que da error

#�Cu�l es la codificaci�n en lenguaje m�quina de la instrucci�n lw $s1,0($t1)?
#Desglosa la instrucci�n en los distintos campos del formato.
#--> 0x8d310000== 10011 Cod operaci�n
