.data
in1: .asciiz "Primeiro número: "
in2: .asciiz "Primeiro número: "
r1: .asciiz "Quociente: "
r2: .asciiz "Resto: "

.text
li $v0, 4
la $a0, in1
syscall

li $v0, 5
syscall

move $s0, $v0

li $v0, 4
la $a0, in2
syscall

li $v0, 5
syscall 

move $s1, $v0

div $s0, $s1

mflo $s2
mfhi $s3

li $v0, 4
la $a0, r1
syscall 

li $v0, 1
move $a0, $s2
syscall 

li $v0, 4
la $a0, r2
syscall 

li $v0, 1
move $a0, $s3
syscall 


