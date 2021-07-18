li $t0, 0x3F800000    # 1
mtc1 $t0, $f1         # movemos $t0 -> $f12=0xFF800000  
li $t1, 0xC0200000    # -2.5  
mtc1 $t1, $f2    # movemos $t1 -> $f20=0x7F8003A0 
