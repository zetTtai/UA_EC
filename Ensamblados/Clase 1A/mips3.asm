.data 
 	array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
 	long: .word 10  
 	suma :.word 0
 	
 	r.suma: .asciiz "La suma de los elementos es: "
 	r.media: .asciiz "Obtenemos un valor medio de: "
	n: .asciiz "\n"
.text
move $t0,$zero 
move $t1,$zero # $t1&lt;-- "suma" con valor inicial 0

la $s0, array
bucle:
lw $s1,0($s0) # Carga del elemento referenciado por la dirección guardada en t1, se carga en s1
add $t1,$t1,$s1 # Suma el elemento a la suma anterior
add $t0,$t0,1 # Incremento del indice
addi $s0,$s0,4 # Incrementamos la dirección base sumándole 4 bytes para que así apunte al siguiente elemento del vector la dirección de memoria.

blt $t0,$t2,bucle # Repite el bucle si no se ha llegado al ultimo elemento (indice&lt;4)
sw $t1,suma #Almacenamos en el registro $t1 el valor de la variable suma

lw $a0,suma #Cargamos en el registro $a0 el valor de la variable suma

li $v0,1 #Solicitamos imprimir un entero
syscall #Hacemos la llamada al sistema

	