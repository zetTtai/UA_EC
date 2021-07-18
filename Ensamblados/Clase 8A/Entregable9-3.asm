 .data
 	Xpide:.asciiz "X = " 
 	Ypide:.asciiz "Y = "
 	MaxRes: .asciiz "El mayor es " 
 	n: .asciiz "\n" 
 .text 
la $a0, Xpide  
li $v0,4  
syscall  
li $v0,6 
syscall 
mov.s $f1, $f0#Guardamos en $f1 el valor de X
mov.s $f12,$f0

la $a0, Ypide  
li $v0,4  
syscall  
li $v0,6  
syscall  
mov.s $f2, $f0#Guardamos en $f2 el valor de Y
mov.s $f14,$f0 

jal max  

la $a0,MaxRes  
li $v0,4 
syscall  
mov.s $f12,$f0  
li $v0,2  
syscall    

li $v0,10  
syscall 
 
 
max:#El valor de X está en $f1 y el valor de Y está en $f2
	c.le.s $f1, $f2 #Comparamos si $f1 <= $f2
	#Si flag a 1 --> $f1 es menor(X es menor)
	bc1t X_menor
	mov.s $f0, $f1
	jr $ra
X_menor:
	mov.s $f0, $f2
	jr $ra
