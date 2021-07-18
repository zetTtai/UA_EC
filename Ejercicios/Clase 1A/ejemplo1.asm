# Código ejemplo 1.  
li $t0, 0xFF800000    # Menos infinito 
 mtc1 $t0, $f12         # movemos $t0 -> $f12=0xFF800000  
 li $t1, 0x7F8003A0     # Not a Number  (NaN)   
 mtc1 $t1, $f20    # movemos $t1 -> $f20=0x7F8003A0 
 

#Haciendo uso de la herramienta de representación en coma flotante del MARS,
#comprueba que realmente en $f12 hay un -? y en $f20 un NaN según el estándar IEEE 754.
#--> 0xff800000 : -Infinity
#--> 0x7f8003a0 : NaN

