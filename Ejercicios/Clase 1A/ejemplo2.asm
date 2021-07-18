 # Código ejemplo 2. Conversión de tipo 
 
addi $s0, $0, -8  # Metemos $s0 = 0xfffffff8  
mtc1 $s0, $f0  # movemos $s0 -> $f0 = 0xfffffff8
cvt.s.w $f0, $f0  # de w a s -> $f0 = 0xc1000000 



#¿Qué valor consideraría la máquina que  habría en $f0 si no hiciésemos la conversión
#con la instrucción cvt.s.w?. Aprovecha que puedes ver contenidos en decimal y
#en hexadecimal. 
#--> Aparecería un NaN
