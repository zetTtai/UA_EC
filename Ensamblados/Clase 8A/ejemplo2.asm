  # Determinar el menor de dos n�meros en coma flotante 
  	 ...         
  	c.lt.s  $f0,$f2     # es < A B?  
        bc1t    print_A     # s� � escribir en consola A  
        c.lt.s  $f2,$f0     # es B < A?   
        bc1t    print_B     # s� � Escribir  consuela B  
        ... 
#�Qu� c�digo de condici�n se ve afectado? 
#--> El 1
#�Hasta cu�ndo permanecer� el valor del c�digo de condici�n?
#--> Hasta que se vuelva a modificar