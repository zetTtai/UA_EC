 # C�digo ejemplo 2. Conversi�n de tipo 
 
addi $s0, $0, -8  # Metemos $s0 = 0xfffffff8  
mtc1 $s0, $f0  # movemos $s0 -> $f0 = 0xfffffff8
cvt.s.w $f0, $f0  # de w a s -> $f0 = 0xc1000000 



#�Qu� valor considerar�a la m�quina que  habr�a en $f0 si no hici�semos la conversi�n
#con la instrucci�n cvt.s.w?. Aprovecha que puedes ver contenidos en decimal y
#en hexadecimal. 
#--> Aparecer�a un NaN
