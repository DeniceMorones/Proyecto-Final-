nop
main:
lw $0 0($15)        # Cargar el número en $t0 (n)
lw $1 2($15)        # Cargar la constante 1 en $t1
lw $2 1($15)      # Inicializar el acumulador con 1 en $t2 (result)
lw $3 3($15)      # Inicializar $t3 con 0

factorial_loop:
slt $4 $0 $1   # Establecer $t4 a 1 si $t0 < 1
beq $4 $3 end_factorial  # Si $t0 >= 1, continuar el bucle

lw $5 3($15)        # Inicializar multiplicador en $t5 con 0
lw $6 1($15)      # Cargar el valor de result en $t6 (multiplicando)

multiply_loop:
beq $0 $3 end_multiply   # Si el multiplicador (n) es 0, terminar multiplicación
add $5 $5 $6            # result = result + multiplicando
sub $0 $0 $1            # n = n - 1
j multiply_loop              # Repetir el bucle de multiplicación

end_multiply:
add $2 $5 $3            # Guardar el resultado de la multiplicación en $t2
lw $0 0($15)                  # Recargar el valor de n
sub $0 $0 $1            # n = n - 1
sw $0 0($15)                  # Guardar el nuevo valor de n en memoria
lw $0 0($15)                  # Cargar el nuevo valor de n en $t0
j factorial_loop             # Repetir el bucle de factorial

end_factorial:
sw $2 1($15)      # Guardar el resultado en memoria

nop                 