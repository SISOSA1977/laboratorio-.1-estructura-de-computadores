.data
n: .word 5  # numero de terminos de la serie de Fibonacci a calcular
msg: .asciiz "-"
.text
.globl main

main:
    # Cargar el valor de n en $t0
    lw $t0, n

    # Inicializar los primeros dos terrminos de la serie (F(0) y F(1))
    li $t1, 0   # F(0)
    li $t2, 1   # F(1)

    # Imprimir F(0) y F(1)
    li $v0, 1        # codigo de llamada al sistema para imprimir un entero
    move $a0, $t1    # Cargar F(0) en $a0
    syscall
    
    move $a0, $t2    # Cargar F(1) en $a0
    syscall
    
    #Guion separador de numeros
    li $v0, 4
        la $a0, msg
        syscall

    # Calcular e imprimir los siguientes terrminos de la serie
    loop:
        # Calcular el siguiente terrmino F(n) = F(n-1) + F(n-2)
        add $t3, $t1, $t2  # $t3 = F(n-1) + F(n-2)

        # Imprimir el termino calculado
        move $a0, $t3    # Cargar F(n) en $a0
        li $v0, 1        # codigo de llamada al sistema para imprimir un entero
        syscall
        
        #Guion separador de numeros
        #li $v0, 4
        #la $a0, msg
        #syscall

        # Actualizar los valores de $t1 y $t2 para la siguiente iteracion
        move $t1, $t2    # F(n-2) = F(n-1)
        move $t2, $t3    # F(n-1) = F(n)

        # Decrementar el contador n
        sub $t0, $t0, 1

        # Verificar si hemos calculado todos los terminos
        bnez $t0, loop

    # Salir del programa
    li $v0, 10       # codigo de llamada al sistema para salir
    syscall
