nop
lw $0 0($15)
lw $1 1($15)
lw $2 2($15)
lw $3 3($15)
lw $4 4($15)
lw $5 5($15)
lw $6 6($15)
j 9
add $20 $0 $1
sub $21 $2 $3
or $24 $8 $9
and $25 $10 $11
slt $26 $12 $13
nop
beq $1 $2 2
addi $27 $14 10
ori $28 $15 40
andi $29 $16 80
slti $30 $17 100
sw $20 4($3)