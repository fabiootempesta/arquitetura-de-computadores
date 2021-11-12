.data

r: .word 9, -10, 2, 265, 23, 1241, 154, -63, 25, 499, 230
num: .asciiz "Número: "
i: .asciiz "Índice: "
re: .asciiz "Resultado: "

.text

li $v0, 4
la $a0, num
syscall 

li $v0, 5
syscall 

move $s0, $v0

li $v0, 4
la $a0, i
syscall 

li $v0, 5
syscall 

move $s1, $v0

sll $s1, $s1, 2

la $t0, r
add $t1, $t0, $s1

lw $t2, 0($t1)

add $s2, $s0, $t2

li $v0, 4
la $a0, re
syscall 

li $v0, 1
move $a0, $s2
syscall 

