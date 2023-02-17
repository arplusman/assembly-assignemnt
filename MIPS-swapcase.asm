.text

.macro change_char()
	slt $t4, $t2, $s0
	beq $t4, $zero, Exit
	slt $t4, $t2, $s3
	bne $t4, $zero, Exit
	slt $t4, $t2, $s2
	bne $t4, $zero, uptolow
	slt $t4, $t2, $s1
	beq $t4, $zero, lowtoup
	
	uptolow:
		add $t2, $t2, 32
		sb $t2, 0($t1)
		j Exit
	lowtoup:
		sub $t2, $t2, 32
		sb $t2, 0($t1)
	Exit:
.end_macro
.globl main
main:
	addi $v0, $zero, 5
	syscall
	add $s4, $zero, $v0
	addi $s4, $s4, 1
	
	addi $v0, $zero, 8
	la $a0, str
	add $a1, $zero, $s4
	syscall
	
	addi $s0, $zero, 123
	addi $s1, $zero, 97
	addi $s2, $zero, 91
	addi $s3, $zero, 65
	la $t1, str
	add $t0, $zero, $zero
	Loop:
		lb $t2, 0($t1)
		change_char()
		slt $t5, $t0, $s4
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		bne $t5, $zero, Loop
	la $a0, str
	addi $v0, $zero, 4
	syscall
		
		
		
.data
	str: .space 100