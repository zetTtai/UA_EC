.data
str:.ascii "Estructuras de los"
    .asciiz "Computadores" #Tiene '\0' al final
cad1:
    	.asciiz "El número de caracteres de la cadena es: "
cad2:
	.asciiz "El número de veces que se repite la letra 'u' es: "
n: .asciiz "\n" #Salto de línea
.text
la $s0, str
add $s1, $zero, $zero # Iniciamos contador a 0
li $s2, 0 #Contador de u
li $s3, 'u'
loop:
 add $t0, $s0, $s1 # dirección del byte a examinar
 lb $t1, 0( $t0 )
 
 bne $t1, $s3, no_es_u
 addi $s2, $s2, 1
 
 no_es_u:
 
 beq $t1, $zero, exit # Salimos si carácter leído='\0'
 addi $s1, $s1, 1 # Y si no incrementamos el contador
 
 j loop
 
exit: 
la $a0, cad1
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall

la $a0, n #Salto de linea
li $v0, 4
syscall

la $a0, cad2
li $v0, 4
syscall

move $a0, $s2
li $v0, 1
syscall

li $v0, 10
 syscall
