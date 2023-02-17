.text
.globl main
main:
	la $a0, A
	la $a1, X
	lw $a1, 0($a1)
	la $t0, size
	li $a2, 0
	lw $a3, 0($t0)
	jal binarySearch
j exit

binarySearch:
	subi $sp, $sp, 12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	add $t0, $a2, $a3
	srl $t0, $t0, 1
	sll $t0, $t0, 2
	add $t0, $t0, $a0
	lw $t0, 0($t0)
	beq $t0, $a1, foundNumber
	slt $t1, $t0, $a1
	beq $t1, 1, lessThan
	subi $a3, $a3, 1
	jal binarySearch
	j finalJobs
	foundNumber:
		add $v0, $a2, $a3
		srl $v0, $v0, 1
		j finalJobs
	lessThan:
		addi $a2, $a2, 1
		jal binarySearch
		j finalJobs
	finalJobs:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		addi $sp, $sp, 12
		jr $ra
exit:
	move $a0, $v0
	li $v0, 1
	syscall
.data
	A: .word 2, 5, 10, 13, 16, 19, 23
	X: .word 16
	size: .word 7
