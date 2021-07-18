  # Código ejemplo4 Desbordamiento 
 
addi $s0, $0, 1  
sll $s0, $s0, 30# $s0 = 2^30 
mtc1 $s0, $f0  
cvt.s.w $f0, $f0            # $f0 = 2^30   
mul.s $f0, $f0, $f0        # $f0 = 2^60  
mul.s $f0, $f0, $f0        # $f0 = 2^120  
mul.s $f0, $f0, $f0        # $f0 = 2^240 -> overflow

#Ensambla y ejecuta el código. 

