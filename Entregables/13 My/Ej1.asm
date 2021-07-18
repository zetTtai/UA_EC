# Excepción por desbordamiento aritmético
li $t0, 0x7FFFFFFF
addiu $t1, $t0,1 #Se ignora el desbordamiento

addi $t2, $t0, 1 #Detecta el desbordamiento
