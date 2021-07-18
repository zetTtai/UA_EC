# Imprimir en consola valores hexadecimales
.text 0x00400000
	ori $a0,$0,0xCAFE #En $a0 el valor a escribir
	ori $v0,$0,34 #Función 34, print hexadecimal
	syscall #Escribe en consola el valor $a0
