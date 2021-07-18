 # Código ejemplo 3 
 
li $s0, 841242345  
mtc1 $s0, $f0  # movemos de $s0 a $f0
cvt.s.w $f1, $f0  # Conversión de entero-simple precisión   
cvt.w.s $f1, $f1  # Conversión de simple precisión-entero  
mfc1 $s1, $f1  # movemos de $f1 a $s1

#¿Cuál es la razón  por la que al finalizar el programa los contenidos de $s0 y $s1 son distintos? 

