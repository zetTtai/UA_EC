#Ensamblad el programa y observad en qué direcciones se colocan las instrucciones.
#Ejecutadlo a pasos. Fijaos en la ventana de registros como van cambiando los contenidos de los registros PC y $ra. 

# Prueba de llamada a una función
.text
li $a0, '>' #Comienza programa principal
li $v0,11
syscall
li $v0,5
syscall #Leer un enter
addi $t1,$v0,10
move $a0, $t1 #argumento a pasar en $a0
jal imprim #llamamos a la función
add $t1, $t1,$t1
move $a0, $t1 #argumento a pasar en $a0
jal imprim #llamamos a la función
li $v0,10 #Acaba el programa
syscall
 #---------Funcions---------
imprim: addi $v0,$0,1 #comienza la función
syscall #Escribe un valor
li $a0, '\n' #Salto de línia
li $v0,11
syscall
jr $ra #Vuelta al programa principal