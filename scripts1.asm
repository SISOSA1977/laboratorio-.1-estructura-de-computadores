.data
number1: .word 30
number2: .word 10
number3: .word 20   
result:  .word 0            # Variable para almacenar el numero menor
msg: .asciiz "El numero menor es:"

.text
.globl main

main:
    lw $t0, number1		# Cargar el primer numero en $t0
    lw $t1, number2		# Cargar el segundo numero en $t1
    lw $t2, number3		# Cargar el segundo numero en $t2
    lw $t3, result		# Cargar el tercer numero en $t3

    # Encontrar el numero menor
    move $t3, $t0           # Inicializar $t4 con el primer numero
    bgt $t1, $t3, check_t2  # Comparar con el segundo numero
    move $t3, $t1
check_t2:
    bgt $t2, $t3, store_min # Comparar con el tercer numero
    move $t3, $t2
store_min:
    sw  $t3, result          # Almacenar el numero menor en result
    
    #Imprimir en pantalla
    li $v0, 4
    la $a0, msg
    syscall 
    li $v0, 1        # Código de llamada al sistema para imprimir un entero
    lw $a0, result   # Cargamos el valor a imprimir desde "resultado"
    syscall

    # Terminar el programa
    li $v0, 10               # Cerrar el programa
    syscall