# detectar casos especiales del formato IEEE 754 
.data   
	 mmask: .word 0x007FFFFF    
	 emask: .word 0x7F800000   
	 exp1: .word 255 
	 desborda: .asciiz "Hay desbordamiento"
	 Nodesborda: .asciiz "No hay desbordamiento"
	 nan: .asciiz "Como la mantisa distinto de 0 obtenemos un NaN"
	 inf: .asciiz "Como la mantisa es igual a 0 obtenemos un Infinito que depende el signo de S"
	 cero: .asciiz "Como el exponente y la mantisa son cero, obtenemos 0"
	 desnormalizado: .asciiz "Como el exponente es 0 y la mantisa distinta de 0 entonces es un número desnormalizado"

.text   
addi $s0, $0, 1   
sll $s0, $s0, 30 # $s0 = 2^30   
mtc1 $s0, $f0   
cvt.s.w $f0, $f0 # $f0 = 2^30   
mul.s $f0, $f0, $f0 # $f0 = 2^60   
mul.s $f0, $f0, $f0 # $f0 = 2^120   
mul.s $f0, $f0, $f0 # $f0 = 2^240 -> overflow 
#Valor a comprobar en $f0 
mfc1 $s0,$f0     
lw $t4, mmask # cargar mascara de la mantisas #Numero que tengo y la mantisa
and $t0,$s0,$t4 # extraer mantisa de $s0  
lw $t4, emask # cargar mascara del exponente  
and $t2,$s0,$t4 # extraer exponente de $s0  #Numero que tengo y el exponente
srl $t2,$t2,23 # desplazar exponente  
lw $t3,exp1   #cargamos valor exponente todo a unos  
beq $t2,$t3,exp_a_1 #exponente todo a unos? 

beq $t2, $0, exp_a_0
j fin
exp_a_1:
	beq $t0, $s0, infinito
	la $a0, nan
	li $v0, 4
	syscall
	j fin
exp_a_0:
	beq $t0, $	
infinito:
	la $a0, inf
	li $v0, 4
	syscall
	j fin
fin: 
	li $v0, 10
	syscall
