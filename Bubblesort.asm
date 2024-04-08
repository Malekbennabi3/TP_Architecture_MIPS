.data
t: .word 10, 9, 38, -7, -128, 5, -4, 0, 2, -8
.text
sort :
li $t0, 0
li $t6, 10
loop :
la $t1, t
beq $t0, $t6, exitLoop
sub $t5, $t6, $t0
addi $t5, $t5, -1
li $t4, 0 #j compteur
addi $t0, $t0, 1
j pass_loop
pass_loop:
beq $t4, $t5, loop
lw $t2, 0($t1)
lw $t3, 4($t1)
bgt $t2, $t3, swap
j next
swap :
sw $t2, 4($t1) # t2 := [i+1]
sw $t3, 0($t1) # t3 := [i]
j next
next:
lw $t2, 0($t1)
addi $t1, $t1, 4
addi $t4, $t4, 1
j pass_loop
exitLoop:
li $v0, 1
move $a0, $t2
syscall
