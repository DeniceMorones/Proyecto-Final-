nop
lw $0 0($15)
lw $1 2($15)
lw $2 1($15)
lw $3 3($15)
nop
slt $4 $0 $1
beq $4 $1 13
lw $5 3($15)
lw $6 0($15)
nop
beq $6 $3 3
add $5 $5 $2
sub $6 $6 $1
j 11
add $2 $5 $3
lw $0 0($15)
sub $0 $0 $1
sw $0 0($15)
lw $0 0($15)
j 6
sw $2 1($15)
nop