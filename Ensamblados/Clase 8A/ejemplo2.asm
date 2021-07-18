  # Determinar el menor de dos números en coma flotante 
  	 ...         
  	c.lt.s  $f0,$f2     # es < A B?  
        bc1t    print_A     # sí – escribir en consola A  
        c.lt.s  $f2,$f0     # es B < A?   
        bc1t    print_B     # sí – Escribir  consuela B  
        ... 
#¿Qué código de condición se ve afectado? 
#--> El 1
#¿Hasta cuándo permanecerá el valor del código de condición?
#--> Hasta que se vuelva a modificar