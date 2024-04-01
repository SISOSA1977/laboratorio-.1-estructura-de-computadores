.data
number1: .word 100
number2: .word 200
number3: .word 50 
result:  .word 0            # Variable para almacenar el numero mayor
msg: .asciiz "El numero mayor es:"



.text
.globl main

main:
    lw $t0, number1       # Cargar el primer numero en $t0
    lw $t1, number2       # Cargar el primer numero en $t1
    lw $t2, number3       # Cargar el segundo numero en $t2
            

    # Encontrar el numero mayor
    move $t3, $t0           # Inicializar $t4 con el primer numero
    blt $t1, $t3, check_t2  # Comparar con el segundo numero
    move $t3, $t1
check_t2:
    blt $t2, $t3, store_max # Comparar con el tercer numero
    move $t3, $t2
store_max:
    sw $t3, result        # Almacenar el numero mayor en result
    
    #Imprimir en pantalla "El numero mayor es:"
    li $v0, 4
    la $a0, msg
    syscall 
    #Imprimir en pantalla un entero
    li $v0, 1        # Código de llamada al sistema para imprimir un entero
    lw $a0, result   # Cargamos el valor a imprimir desde "resultado"
    syscall
            
    # Terminar el programa
    li $v0, 10               # Cerrar el programa
    syscall
