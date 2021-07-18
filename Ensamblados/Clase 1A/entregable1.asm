.data 
	demanaPi : .asciiz "Dame el valor de pi..." 
	pideRadio: .asciiz "Dame el radio... " 
	long:   .asciiz "Longitud de la circunferència = " 
	super: .asciiz "Área del círculo = " 
	n: .asciiz "\n"
.text  
li $v0,4
la $a0,demanaPi  
syscall  
li $v0,6  
syscall 
 
mov.s $f1, $f0  #Pi en $f1 y Radio en $f0
li $v0,4  
la $a0,pideRadio  
syscall 
li $v0,6  
syscall  
#Calculamos la longitud
li $v0,4  
la $a0,long  
syscall    
jal calculaLog #Llamamos a la función para calcular la longitud
li $v0,4
la $a0, n
syscall
#Calculamos el area
li $v0, 4
la $a0, super
syscall
jal calculaArea #Llamamos a la función para calcular el area

li $v0,10 #Finalizar programa
syscall 

calculaLog:#L= 2*pi*radio
li $s0, 0x40000000
mtc1 $s0, $f2
mul.s $f4, $f0, $f1 #Guardamos en $f4 el resulatdo de radio*pi
mul.s $f12, $f4, $f2 #Multiplicamos por 2 y guardamos a $f5
#Guardamos n $f12 para poder imprimirlo
li $v0, 2 #Imprimimos el float
syscall
jr $ra #Volvemos al programa

calculaArea:#A= pi*r^2
mul.s $f4, $f0, $f0 #Multiplicamos radio*radio
mul.s $f12, $f4, $f1 #Multiplicamos pi*$f4(radio^2)
#Guardamos n $f12 para poder imprimirlo
li $v0, 2 #Imprimimos el float
syscall
jr $ra
	
	
	
	
	
	
	

	
