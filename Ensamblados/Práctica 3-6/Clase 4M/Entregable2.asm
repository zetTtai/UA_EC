#Haz el código que lee de teclado dos valores positivos A y B en los que A<B. El
#programa tiene que escribir por consola los valores comprendidos entre ambos,
#incluyéndolos a ellos mismos. Es decir, si A=3 y B=6, escribe en la consola 3 4
#5 6 
.text
	li $a0, '>'
	li $v0, 11 #Imprimir
	syscall
	li $v0, 5 #Leemos A
	syscall 
	move $s0, $v0 #Inicializamos el valor mínimo a A
	li $a0, '>'
	li $v0, 11 #imprimir
	syscall
	li $v0, 5 #Leemos B
	syscall
	move $s1, $v0 #Inicializamos el valor final a B
	li $s2, 0 #Inciamos el contador
inicio_for: 
	
	add $s2, $s2, $s0 #cuerpo del bucle
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	addi $s0, $s0, 1 #Incremento
	
	li $a0, '\n'
	li $v0, 11
	syscall
	
	sle $t1, $s0, $s1
	beqz $t1, final_for
	
	j inicio_for
	
final_for:
	li $v0, 10
	
