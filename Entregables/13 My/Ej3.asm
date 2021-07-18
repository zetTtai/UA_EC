# Excepción por dirección no alineada en Load
.data
vector: .word 1, 3, 5, 7, 11, 13
.text
#. . .
la $t0, vector
lw $t0, 3($t0)


