 #¿Cuál es la razón por la que el registro base de las instrucciones lwc1 y swc1
 #pertenecen al banco de registros de enteros y no de la FPU? 
 #--> La razón es porque las direcciones son números enteros
 
 # Código ejemplo 1
 
.data 
 
 vector1: .float 5.6e+20, -5.6e+20, 1.2  
 vector2: .float 1.2, 5.6e+20, -5.6e+20 
 
.text  
la $t0, vector1  
lwc1 $f0, 0($t0)   
lwc1 $f1, 4($t0)   
lwc1 $f2, 8($t0)   
#Sumar los componentes de un vector
add.s $f3, $f0, $f1  
add.s $f4, $f2, $f3 #f4 tiene el valor de la suma de los elementos de vector1
 
 la $t1, vector2  
 lwc1 $f5, 0($t1)
 lwc1 $f6, 4($t1)   
 lwc1 $f7, 8($t1)   
 add.s $f8, $f5, $f6  
 add.s $f9, $f7, $f8 
 
 #Haz una traza del programa a mano y obtén el valor de los registros del $f0 al $f9.
 #Conviene notar que vector1 y vector2 tienen los mismos elementos, pero con diferente orden.
 #Observa los resultados que hay en $f4 y $f9. 
 
 #Ensambla, ejecuta el programa y observa el contenido que adquieren los registros para verificar
 #los resultados que has obtenido a mano. ¿Qué conclusión puedes sacar? 
 #--> Al sumar un número pequeño y un número grande, los resultados obtenidos en $f4 y %f9 son 
 #distintos por el redondeo