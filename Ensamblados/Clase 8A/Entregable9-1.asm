.data 
 	Array: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
 	long: .word 10  
 	Suma: .float 0
 	msg: .asciiz "El valor medio del vector Array es: "
 	n: .asciiz "\n"
.text
la $s0, Array
lw $s1, long
add $t1, $zero, $zero #Iniciliazamos el contador a 0
add $t2, $zero, $zero #Inicializamos el indice a 0
loop:
	lwc1 $f0, 0($s0) #Guardamos en $f0 el valor del vector
	
	add.s $f5, $f5, $f0#Guardamos la suma total en $f5
	
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	addi $s0, $s0, 4
	
	bne $t1, $s1, loop
	mtc1 $s1, $f1 #Guardamos en $f1 el valor de $s1
	cvt.s.w $f4, $f1#Contertimos a entero y guardamos en $f4
	
	div.s $f9, $f5, $f4#Dividimos el resultado y lo guardamos en $f9
	
	la $a0, msg
	li $v0, 4
	syscall
	mov.s $f12, $f9#Movemos a $f12 para poder imprimir el resultado
	li $v0, 2
	syscall
	li $v0, 10
	syscall
