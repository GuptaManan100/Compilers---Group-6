func0:
la $sp, 420($sp)
lw $14, -4($sp)
la $sp, -4($sp)
lw $15, -4($sp)
la $sp, -4($sp)
lw $16, -4($sp)
la $sp, -4($sp)
lw $17, -4($sp)
la $sp, -4($sp)
lw $18, -4($sp)
la $sp, -4($sp)
lw $19, -4($sp)
la $sp, -4($sp)
lw $20, -4($sp)
la $sp, -4($sp)
lw $21, -4($sp)
la $sp, -4($sp)
l.s $f14, -4($sp)
la $sp, -4($sp)
l.s $f15, -4($sp)
la $sp, -4($sp)
l.s $f16, -4($sp)
la $sp, -4($sp)
l.s $f17, -4($sp)
la $sp, -4($sp)
l.s $f18, -4($sp)
la $sp, -4($sp)
l.s $f19, -4($sp)
la $sp, -4($sp)
l.s $f20, -4($sp)
la $sp, -4($sp)
l.s $f21, -4($sp)
la $sp, -4($sp)
la $sp, -356($sp)
li $22, 1
add $3, $22, $0
add $20, $3, $0
add $14, $20, $0
li $v0, 1
add $25, $a0, $0
add $a0, $14, $0
syscall
add $a0, $25, $0
la $sp, -4($sp)
jr $ra
func1:
la $sp, 420($sp)
lw $14, -4($sp)
la $sp, -4($sp)
lw $15, -4($sp)
la $sp, -4($sp)
lw $16, -4($sp)
la $sp, -4($sp)
lw $17, -4($sp)
la $sp, -4($sp)
lw $18, -4($sp)
la $sp, -4($sp)
lw $19, -4($sp)
la $sp, -4($sp)
lw $20, -4($sp)
la $sp, -4($sp)
lw $21, -4($sp)
la $sp, -4($sp)
l.s $f14, -4($sp)
la $sp, -4($sp)
l.s $f15, -4($sp)
la $sp, -4($sp)
l.s $f16, -4($sp)
la $sp, -4($sp)
l.s $f17, -4($sp)
la $sp, -4($sp)
l.s $f18, -4($sp)
la $sp, -4($sp)
l.s $f19, -4($sp)
la $sp, -4($sp)
l.s $f20, -4($sp)
la $sp, -4($sp)
l.s $f21, -4($sp)
la $sp, -4($sp)
la $sp, -356($sp)
add $20, $14, $0
add $3, $20, $0
li $22, 1
add $4, $22, $0
add $21, $4, $0
beq $3, $21, L1
j L0
L0:
add $20, $14, $0
add $3, $20, $0
li $22, 0
add $4, $22, $0
add $21, $4, $0
beq $3, $21, L1
j L2
L1:
li $22, 1
add $3, $22, $0
sw $3, -4($sp)
la $sp, -4($sp)
jr $ra
L2:
add $20, $14, $0
add $3, $20, $0
li $22, 1
add $4, $22, $0
add $20, $3, $0
add $21, $4, $0
sub $22, $20, $21
add $5, $22, $0
li $25, 0x10030000
sw $5, 0($25)
li $25, 0x10030000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10035000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
sw $ra, -4($sp)
la $sp, -4($sp)
sw $3, -4($sp)
la $sp, -4($sp)
sw $4, -4($sp)
la $sp, -4($sp)
sw $5, -4($sp)
la $sp, -4($sp)
sw $6, -4($sp)
la $sp, -4($sp)
sw $7, -4($sp)
la $sp, -4($sp)
sw $8, -4($sp)
la $sp, -4($sp)
sw $9, -4($sp)
la $sp, -4($sp)
sw $10, -4($sp)
la $sp, -4($sp)
sw $11, -4($sp)
la $sp, -4($sp)
sw $12, -4($sp)
la $sp, -4($sp)
sw $13, -4($sp)
la $sp, -4($sp)
sw $14, -4($sp)
la $sp, -4($sp)
sw $15, -4($sp)
la $sp, -4($sp)
sw $16, -4($sp)
la $sp, -4($sp)
sw $17, -4($sp)
la $sp, -4($sp)
sw $18, -4($sp)
la $sp, -4($sp)
sw $19, -4($sp)
la $sp, -4($sp)
sw $20, -4($sp)
la $sp, -4($sp)
sw $21, -4($sp)
la $sp, -4($sp)
s.s $f3, -4($sp)
la $sp, -4($sp)
s.s $f4, -4($sp)
la $sp, -4($sp)
s.s $f5, -4($sp)
la $sp, -4($sp)
s.s $f6, -4($sp)
la $sp, -4($sp)
s.s $f7, -4($sp)
la $sp, -4($sp)
s.s $f8, -4($sp)
la $sp, -4($sp)
s.s $f9, -4($sp)
la $sp, -4($sp)
s.s $f10, -4($sp)
la $sp, -4($sp)
s.s $f11, -4($sp)
la $sp, -4($sp)
s.s $f12, -4($sp)
la $sp, -4($sp)
s.s $f13, -4($sp)
la $sp, -4($sp)
s.s $f14, -4($sp)
la $sp, -4($sp)
s.s $f15, -4($sp)
la $sp, -4($sp)
s.s $f16, -4($sp)
la $sp, -4($sp)
s.s $f17, -4($sp)
la $sp, -4($sp)
s.s $f18, -4($sp)
la $sp, -4($sp)
s.s $f19, -4($sp)
la $sp, -4($sp)
s.s $f20, -4($sp)
la $sp, -4($sp)
s.s $f21, -4($sp)
la $sp, -4($sp)
li $25, 0x10010000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 32($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 36($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 40($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 44($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 48($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 52($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 56($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 60($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 64($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 68($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 72($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 76($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 80($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 84($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 88($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 92($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 96($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10020000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 32($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 36($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 40($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 44($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 48($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 52($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 56($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 60($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 64($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 68($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 72($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 76($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 80($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 84($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 88($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 92($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 96($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
jal func1
lw $2, ($sp)
la $sp, 4($sp)
li $25, 0x10020000
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 96($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 92($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 88($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 84($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 80($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 76($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 72($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 68($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 64($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 60($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 56($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 52($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 48($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 44($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 40($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 36($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 32($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 28($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 24($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 20($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 16($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 12($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 8($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 4($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 0($25)
li $25, 0x10010000
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 96($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 92($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 88($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 84($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 80($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 76($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 72($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 68($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 64($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 60($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 56($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 52($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 48($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 44($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 40($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 36($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 32($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 28($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 24($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 20($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 16($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 12($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 8($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 4($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 0($25)
l.s $f21, ($sp)
la $sp, 4($sp)
l.s $f20, ($sp)
la $sp, 4($sp)
l.s $f19, ($sp)
la $sp, 4($sp)
l.s $f18, ($sp)
la $sp, 4($sp)
l.s $f17, ($sp)
la $sp, 4($sp)
l.s $f16, ($sp)
la $sp, 4($sp)
l.s $f15, ($sp)
la $sp, 4($sp)
l.s $f14, ($sp)
la $sp, 4($sp)
l.s $f13, ($sp)
la $sp, 4($sp)
l.s $f12, ($sp)
la $sp, 4($sp)
l.s $f11, ($sp)
la $sp, 4($sp)
l.s $f10, ($sp)
la $sp, 4($sp)
l.s $f9, ($sp)
la $sp, 4($sp)
l.s $f8, ($sp)
la $sp, 4($sp)
l.s $f7, ($sp)
la $sp, 4($sp)
l.s $f6, ($sp)
la $sp, 4($sp)
l.s $f5, ($sp)
la $sp, 4($sp)
l.s $f4, ($sp)
la $sp, 4($sp)
l.s $f3, ($sp)
la $sp, 4($sp)
lw $21, ($sp)
la $sp, 4($sp)
lw $20, ($sp)
la $sp, 4($sp)
lw $19, ($sp)
la $sp, 4($sp)
lw $18, ($sp)
la $sp, 4($sp)
lw $17, ($sp)
la $sp, 4($sp)
lw $16, ($sp)
la $sp, 4($sp)
lw $15, ($sp)
la $sp, 4($sp)
lw $14, ($sp)
la $sp, 4($sp)
lw $13, ($sp)
la $sp, 4($sp)
lw $12, ($sp)
la $sp, 4($sp)
lw $11, ($sp)
la $sp, 4($sp)
lw $10, ($sp)
la $sp, 4($sp)
lw $9, ($sp)
la $sp, 4($sp)
lw $8, ($sp)
la $sp, 4($sp)
lw $7, ($sp)
la $sp, 4($sp)
lw $6, ($sp)
la $sp, 4($sp)
lw $5, ($sp)
la $sp, 4($sp)
lw $4, ($sp)
la $sp, 4($sp)
lw $3, ($sp)
la $sp, 4($sp)
lw $ra, ($sp)
la $sp, 4($sp)
la $sp, 64($sp)
add $3, $2, $0
add $20, $14, $0
add $4, $20, $0
li $22, 2
add $5, $22, $0
add $20, $4, $0
add $21, $5, $0
sub $22, $20, $21
add $6, $22, $0
li $25, 0x10030000
sw $6, 0($25)
li $25, 0x10030000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10035000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
sw $ra, -4($sp)
la $sp, -4($sp)
sw $3, -4($sp)
la $sp, -4($sp)
sw $4, -4($sp)
la $sp, -4($sp)
sw $5, -4($sp)
la $sp, -4($sp)
sw $6, -4($sp)
la $sp, -4($sp)
sw $7, -4($sp)
la $sp, -4($sp)
sw $8, -4($sp)
la $sp, -4($sp)
sw $9, -4($sp)
la $sp, -4($sp)
sw $10, -4($sp)
la $sp, -4($sp)
sw $11, -4($sp)
la $sp, -4($sp)
sw $12, -4($sp)
la $sp, -4($sp)
sw $13, -4($sp)
la $sp, -4($sp)
sw $14, -4($sp)
la $sp, -4($sp)
sw $15, -4($sp)
la $sp, -4($sp)
sw $16, -4($sp)
la $sp, -4($sp)
sw $17, -4($sp)
la $sp, -4($sp)
sw $18, -4($sp)
la $sp, -4($sp)
sw $19, -4($sp)
la $sp, -4($sp)
sw $20, -4($sp)
la $sp, -4($sp)
sw $21, -4($sp)
la $sp, -4($sp)
s.s $f3, -4($sp)
la $sp, -4($sp)
s.s $f4, -4($sp)
la $sp, -4($sp)
s.s $f5, -4($sp)
la $sp, -4($sp)
s.s $f6, -4($sp)
la $sp, -4($sp)
s.s $f7, -4($sp)
la $sp, -4($sp)
s.s $f8, -4($sp)
la $sp, -4($sp)
s.s $f9, -4($sp)
la $sp, -4($sp)
s.s $f10, -4($sp)
la $sp, -4($sp)
s.s $f11, -4($sp)
la $sp, -4($sp)
s.s $f12, -4($sp)
la $sp, -4($sp)
s.s $f13, -4($sp)
la $sp, -4($sp)
s.s $f14, -4($sp)
la $sp, -4($sp)
s.s $f15, -4($sp)
la $sp, -4($sp)
s.s $f16, -4($sp)
la $sp, -4($sp)
s.s $f17, -4($sp)
la $sp, -4($sp)
s.s $f18, -4($sp)
la $sp, -4($sp)
s.s $f19, -4($sp)
la $sp, -4($sp)
s.s $f20, -4($sp)
la $sp, -4($sp)
s.s $f21, -4($sp)
la $sp, -4($sp)
li $25, 0x10010000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 32($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 36($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 40($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 44($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 48($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 52($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 56($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 60($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 64($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 68($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 72($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 76($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 80($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 84($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 88($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 92($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 96($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10020000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 32($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 36($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 40($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 44($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 48($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 52($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 56($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 60($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 64($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 68($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 72($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 76($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 80($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 84($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 88($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 92($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 96($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
jal func1
lw $2, ($sp)
la $sp, 4($sp)
li $25, 0x10020000
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 96($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 92($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 88($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 84($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 80($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 76($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 72($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 68($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 64($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 60($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 56($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 52($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 48($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 44($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 40($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 36($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 32($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 28($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 24($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 20($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 16($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 12($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 8($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 4($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 0($25)
li $25, 0x10010000
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 96($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 92($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 88($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 84($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 80($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 76($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 72($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 68($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 64($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 60($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 56($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 52($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 48($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 44($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 40($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 36($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 32($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 28($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 24($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 20($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 16($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 12($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 8($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 4($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 0($25)
l.s $f21, ($sp)
la $sp, 4($sp)
l.s $f20, ($sp)
la $sp, 4($sp)
l.s $f19, ($sp)
la $sp, 4($sp)
l.s $f18, ($sp)
la $sp, 4($sp)
l.s $f17, ($sp)
la $sp, 4($sp)
l.s $f16, ($sp)
la $sp, 4($sp)
l.s $f15, ($sp)
la $sp, 4($sp)
l.s $f14, ($sp)
la $sp, 4($sp)
l.s $f13, ($sp)
la $sp, 4($sp)
l.s $f12, ($sp)
la $sp, 4($sp)
l.s $f11, ($sp)
la $sp, 4($sp)
l.s $f10, ($sp)
la $sp, 4($sp)
l.s $f9, ($sp)
la $sp, 4($sp)
l.s $f8, ($sp)
la $sp, 4($sp)
l.s $f7, ($sp)
la $sp, 4($sp)
l.s $f6, ($sp)
la $sp, 4($sp)
l.s $f5, ($sp)
la $sp, 4($sp)
l.s $f4, ($sp)
la $sp, 4($sp)
l.s $f3, ($sp)
la $sp, 4($sp)
lw $21, ($sp)
la $sp, 4($sp)
lw $20, ($sp)
la $sp, 4($sp)
lw $19, ($sp)
la $sp, 4($sp)
lw $18, ($sp)
la $sp, 4($sp)
lw $17, ($sp)
la $sp, 4($sp)
lw $16, ($sp)
la $sp, 4($sp)
lw $15, ($sp)
la $sp, 4($sp)
lw $14, ($sp)
la $sp, 4($sp)
lw $13, ($sp)
la $sp, 4($sp)
lw $12, ($sp)
la $sp, 4($sp)
lw $11, ($sp)
la $sp, 4($sp)
lw $10, ($sp)
la $sp, 4($sp)
lw $9, ($sp)
la $sp, 4($sp)
lw $8, ($sp)
la $sp, 4($sp)
lw $7, ($sp)
la $sp, 4($sp)
lw $6, ($sp)
la $sp, 4($sp)
lw $5, ($sp)
la $sp, 4($sp)
lw $4, ($sp)
la $sp, 4($sp)
lw $3, ($sp)
la $sp, 4($sp)
lw $ra, ($sp)
la $sp, 4($sp)
la $sp, 64($sp)
add $4, $2, $0
add $20, $3, $0
add $21, $4, $0
add $22, $20, $21
add $5, $22, $0
add $20, $5, $0
li $25, 0x10010000
sw $20, 4($25)
li $25, 0x10010000
lw $23, 4($25)
add $20, $23, $0
add $3, $20, $0
sw $3, -4($sp)
la $sp, -4($sp)
jr $ra
la $sp, -4($sp)
jr $ra
main:
li $25, 0x10010000
lw $23, 8($25)
add $20, $23, $0
add $3, $20, $0
li $25, 0x10030000
sw $3, 0($25)
li $25, 0x10030000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10035000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
sw $ra, -4($sp)
la $sp, -4($sp)
sw $3, -4($sp)
la $sp, -4($sp)
sw $4, -4($sp)
la $sp, -4($sp)
sw $5, -4($sp)
la $sp, -4($sp)
sw $6, -4($sp)
la $sp, -4($sp)
sw $7, -4($sp)
la $sp, -4($sp)
sw $8, -4($sp)
la $sp, -4($sp)
sw $9, -4($sp)
la $sp, -4($sp)
sw $10, -4($sp)
la $sp, -4($sp)
sw $11, -4($sp)
la $sp, -4($sp)
sw $12, -4($sp)
la $sp, -4($sp)
sw $13, -4($sp)
la $sp, -4($sp)
sw $14, -4($sp)
la $sp, -4($sp)
sw $15, -4($sp)
la $sp, -4($sp)
sw $16, -4($sp)
la $sp, -4($sp)
sw $17, -4($sp)
la $sp, -4($sp)
sw $18, -4($sp)
la $sp, -4($sp)
sw $19, -4($sp)
la $sp, -4($sp)
sw $20, -4($sp)
la $sp, -4($sp)
sw $21, -4($sp)
la $sp, -4($sp)
s.s $f3, -4($sp)
la $sp, -4($sp)
s.s $f4, -4($sp)
la $sp, -4($sp)
s.s $f5, -4($sp)
la $sp, -4($sp)
s.s $f6, -4($sp)
la $sp, -4($sp)
s.s $f7, -4($sp)
la $sp, -4($sp)
s.s $f8, -4($sp)
la $sp, -4($sp)
s.s $f9, -4($sp)
la $sp, -4($sp)
s.s $f10, -4($sp)
la $sp, -4($sp)
s.s $f11, -4($sp)
la $sp, -4($sp)
s.s $f12, -4($sp)
la $sp, -4($sp)
s.s $f13, -4($sp)
la $sp, -4($sp)
s.s $f14, -4($sp)
la $sp, -4($sp)
s.s $f15, -4($sp)
la $sp, -4($sp)
s.s $f16, -4($sp)
la $sp, -4($sp)
s.s $f17, -4($sp)
la $sp, -4($sp)
s.s $f18, -4($sp)
la $sp, -4($sp)
s.s $f19, -4($sp)
la $sp, -4($sp)
s.s $f20, -4($sp)
la $sp, -4($sp)
s.s $f21, -4($sp)
la $sp, -4($sp)
li $25, 0x10010000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 32($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 36($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 40($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 44($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 48($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 52($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 56($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 60($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 64($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 68($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 72($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 76($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 80($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 84($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 88($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 92($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 96($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10020000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 32($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 36($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 40($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 44($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 48($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 52($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 56($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 60($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 64($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 68($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 72($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 76($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 80($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 84($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 88($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 92($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 96($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
jal func0
lw $2, ($sp)
la $sp, 4($sp)
li $25, 0x10020000
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 96($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 92($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 88($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 84($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 80($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 76($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 72($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 68($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 64($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 60($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 56($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 52($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 48($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 44($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 40($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 36($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 32($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 28($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 24($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 20($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 16($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 12($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 8($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 4($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 0($25)
li $25, 0x10010000
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 96($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 92($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 88($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 84($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 80($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 76($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 72($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 68($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 64($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 60($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 56($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 52($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 48($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 44($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 40($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 36($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 32($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 28($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 24($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 20($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 16($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 12($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 8($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 4($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 0($25)
l.s $f21, ($sp)
la $sp, 4($sp)
l.s $f20, ($sp)
la $sp, 4($sp)
l.s $f19, ($sp)
la $sp, 4($sp)
l.s $f18, ($sp)
la $sp, 4($sp)
l.s $f17, ($sp)
la $sp, 4($sp)
l.s $f16, ($sp)
la $sp, 4($sp)
l.s $f15, ($sp)
la $sp, 4($sp)
l.s $f14, ($sp)
la $sp, 4($sp)
l.s $f13, ($sp)
la $sp, 4($sp)
l.s $f12, ($sp)
la $sp, 4($sp)
l.s $f11, ($sp)
la $sp, 4($sp)
l.s $f10, ($sp)
la $sp, 4($sp)
l.s $f9, ($sp)
la $sp, 4($sp)
l.s $f8, ($sp)
la $sp, 4($sp)
l.s $f7, ($sp)
la $sp, 4($sp)
l.s $f6, ($sp)
la $sp, 4($sp)
l.s $f5, ($sp)
la $sp, 4($sp)
l.s $f4, ($sp)
la $sp, 4($sp)
l.s $f3, ($sp)
la $sp, 4($sp)
lw $21, ($sp)
la $sp, 4($sp)
lw $20, ($sp)
la $sp, 4($sp)
lw $19, ($sp)
la $sp, 4($sp)
lw $18, ($sp)
la $sp, 4($sp)
lw $17, ($sp)
la $sp, 4($sp)
lw $16, ($sp)
la $sp, 4($sp)
lw $15, ($sp)
la $sp, 4($sp)
lw $14, ($sp)
la $sp, 4($sp)
lw $13, ($sp)
la $sp, 4($sp)
lw $12, ($sp)
la $sp, 4($sp)
lw $11, ($sp)
la $sp, 4($sp)
lw $10, ($sp)
la $sp, 4($sp)
lw $9, ($sp)
la $sp, 4($sp)
lw $8, ($sp)
la $sp, 4($sp)
lw $7, ($sp)
la $sp, 4($sp)
lw $6, ($sp)
la $sp, 4($sp)
lw $5, ($sp)
la $sp, 4($sp)
lw $4, ($sp)
la $sp, 4($sp)
lw $3, ($sp)
la $sp, 4($sp)
lw $ra, ($sp)
la $sp, 4($sp)
la $sp, 64($sp)
li $22, 5
add $3, $22, $0
li $25, 0x10030000
sw $3, 0($25)
li $25, 0x10030000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10035000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
sw $ra, -4($sp)
la $sp, -4($sp)
sw $3, -4($sp)
la $sp, -4($sp)
sw $4, -4($sp)
la $sp, -4($sp)
sw $5, -4($sp)
la $sp, -4($sp)
sw $6, -4($sp)
la $sp, -4($sp)
sw $7, -4($sp)
la $sp, -4($sp)
sw $8, -4($sp)
la $sp, -4($sp)
sw $9, -4($sp)
la $sp, -4($sp)
sw $10, -4($sp)
la $sp, -4($sp)
sw $11, -4($sp)
la $sp, -4($sp)
sw $12, -4($sp)
la $sp, -4($sp)
sw $13, -4($sp)
la $sp, -4($sp)
sw $14, -4($sp)
la $sp, -4($sp)
sw $15, -4($sp)
la $sp, -4($sp)
sw $16, -4($sp)
la $sp, -4($sp)
sw $17, -4($sp)
la $sp, -4($sp)
sw $18, -4($sp)
la $sp, -4($sp)
sw $19, -4($sp)
la $sp, -4($sp)
sw $20, -4($sp)
la $sp, -4($sp)
sw $21, -4($sp)
la $sp, -4($sp)
s.s $f3, -4($sp)
la $sp, -4($sp)
s.s $f4, -4($sp)
la $sp, -4($sp)
s.s $f5, -4($sp)
la $sp, -4($sp)
s.s $f6, -4($sp)
la $sp, -4($sp)
s.s $f7, -4($sp)
la $sp, -4($sp)
s.s $f8, -4($sp)
la $sp, -4($sp)
s.s $f9, -4($sp)
la $sp, -4($sp)
s.s $f10, -4($sp)
la $sp, -4($sp)
s.s $f11, -4($sp)
la $sp, -4($sp)
s.s $f12, -4($sp)
la $sp, -4($sp)
s.s $f13, -4($sp)
la $sp, -4($sp)
s.s $f14, -4($sp)
la $sp, -4($sp)
s.s $f15, -4($sp)
la $sp, -4($sp)
s.s $f16, -4($sp)
la $sp, -4($sp)
s.s $f17, -4($sp)
la $sp, -4($sp)
s.s $f18, -4($sp)
la $sp, -4($sp)
s.s $f19, -4($sp)
la $sp, -4($sp)
s.s $f20, -4($sp)
la $sp, -4($sp)
s.s $f21, -4($sp)
la $sp, -4($sp)
li $25, 0x10010000
lw $22, 0($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 4($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 8($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 12($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 16($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 20($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 24($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 28($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 32($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 36($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 40($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 44($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 48($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 52($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 56($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 60($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 64($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 68($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 72($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 76($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 80($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 84($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 88($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 92($25)
sw $22, -4($sp)
la $sp, -4($sp)
lw $22, 96($25)
sw $22, -4($sp)
la $sp, -4($sp)
li $25, 0x10020000
l.s $f22, 0($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 4($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 8($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 12($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 16($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 20($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 24($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 28($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 32($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 36($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 40($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 44($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 48($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 52($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 56($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 60($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 64($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 68($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 72($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 76($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 80($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 84($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 88($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 92($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
l.s $f22, 96($25)
s.s $f22, -4($sp)
la $sp, -4($sp)
jal func1
lw $2, ($sp)
la $sp, 4($sp)
li $25, 0x10020000
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 96($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 92($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 88($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 84($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 80($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 76($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 72($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 68($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 64($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 60($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 56($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 52($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 48($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 44($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 40($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 36($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 32($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 28($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 24($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 20($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 16($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 12($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 8($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 4($25)
l.s $f22, ($sp)
la $sp, 4($sp)
s.s $f22, 0($25)
li $25, 0x10010000
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 96($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 92($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 88($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 84($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 80($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 76($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 72($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 68($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 64($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 60($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 56($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 52($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 48($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 44($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 40($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 36($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 32($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 28($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 24($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 20($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 16($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 12($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 8($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 4($25)
lw $22, ($sp)
la $sp, 4($sp)
sw $22, 0($25)
l.s $f21, ($sp)
la $sp, 4($sp)
l.s $f20, ($sp)
la $sp, 4($sp)
l.s $f19, ($sp)
la $sp, 4($sp)
l.s $f18, ($sp)
la $sp, 4($sp)
l.s $f17, ($sp)
la $sp, 4($sp)
l.s $f16, ($sp)
la $sp, 4($sp)
l.s $f15, ($sp)
la $sp, 4($sp)
l.s $f14, ($sp)
la $sp, 4($sp)
l.s $f13, ($sp)
la $sp, 4($sp)
l.s $f12, ($sp)
la $sp, 4($sp)
l.s $f11, ($sp)
la $sp, 4($sp)
l.s $f10, ($sp)
la $sp, 4($sp)
l.s $f9, ($sp)
la $sp, 4($sp)
l.s $f8, ($sp)
la $sp, 4($sp)
l.s $f7, ($sp)
la $sp, 4($sp)
l.s $f6, ($sp)
la $sp, 4($sp)
l.s $f5, ($sp)
la $sp, 4($sp)
l.s $f4, ($sp)
la $sp, 4($sp)
l.s $f3, ($sp)
la $sp, 4($sp)
lw $21, ($sp)
la $sp, 4($sp)
lw $20, ($sp)
la $sp, 4($sp)
lw $19, ($sp)
la $sp, 4($sp)
lw $18, ($sp)
la $sp, 4($sp)
lw $17, ($sp)
la $sp, 4($sp)
lw $16, ($sp)
la $sp, 4($sp)
lw $15, ($sp)
la $sp, 4($sp)
lw $14, ($sp)
la $sp, 4($sp)
lw $13, ($sp)
la $sp, 4($sp)
lw $12, ($sp)
la $sp, 4($sp)
lw $11, ($sp)
la $sp, 4($sp)
lw $10, ($sp)
la $sp, 4($sp)
lw $9, ($sp)
la $sp, 4($sp)
lw $8, ($sp)
la $sp, 4($sp)
lw $7, ($sp)
la $sp, 4($sp)
lw $6, ($sp)
la $sp, 4($sp)
lw $5, ($sp)
la $sp, 4($sp)
lw $4, ($sp)
la $sp, 4($sp)
lw $3, ($sp)
la $sp, 4($sp)
lw $ra, ($sp)
la $sp, 4($sp)
la $sp, 64($sp)
add $4, $2, $0
add $20, $4, $0
li $25, 0x10010000
sw $20, 8($25)
li $25, 0x10010000
lw $23, 8($25)
li $v0, 1
add $25, $a0, $0
add $a0, $23, $0
syscall
add $a0, $25, $0
la $sp, -4($sp)
jr $ra
li $v0,10
syscall
