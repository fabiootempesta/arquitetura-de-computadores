.data
in1: .asciiz "Primeiro número: "
in2: .asciiz "Primeiro número: "
r: .asciiz "Resultado: "

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

sub $s2, $s0, $s1

li $v0, 4
la $a0, r
syscall 

li $v0, 1
move $a0, $s2
syscall 

