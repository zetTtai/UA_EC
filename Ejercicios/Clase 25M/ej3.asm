# Ejemplo de direccionamiento
.data
A:.word 6
B:.word 8
C:.space 4
.text
la $t0,A # En $t0 la dirección de A
lw $t1,0($t0) # Direccionamiento indirecto (dirección en $t0)
lw $t2,4($t0) # Direccionamiento relativo (dirección =$t0+4)
add $t3,$t1,$t2
sw $t3,C # Direccionamiento absoluto (dirección =C)
