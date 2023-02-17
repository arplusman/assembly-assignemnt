li $v0, 12
syscall
subi $t0, $v0, 95
srl $t0, $t0, 31
li $t1, 10
mul $t1, $t1, $t0
la $a0, Output
add $a0, $t1, $a0
li $v0, 4
syscall
.data
	a: .asciiz "a"
	A: .asciiz "A"
	z: .asciiz "z"
	Z: .asciiz "Z"
	Output: .asciiz "lowercase", "uppercase"
