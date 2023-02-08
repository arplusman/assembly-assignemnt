.text

.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	la $s0, array
	jal fib
	move $a0, $v0
	li $v0, 1
	syscall
	j exit
fib:
	subi $sp, $sp, 12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	beq $a0, 0, returnZero
	beq $a0, 1, returnOne
	sll $t0, $a0, 2
	add $t0, $t0, $s0
	lw $t1, 0($t0)
	beq $t1, 0, else
	
	move $v0, $t1
	j finalJobs
	returnZero:
		li $v0, 0
		j finalJobs
	returnOne:
		li $v0, 1
		j finalJobs
	else:
	subi $sp, $sp, 4
	sw $a0, 0($sp)
	subi $a0, $a0, 1
	jal fib
	move $t1, $v0
	subi $a0, $a0, 1
	jal fib
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	move $t0, $v0
	add $v0, $t0, $t1
	sll $t0, $a0, 2
	add $t0, $t0, $s0
	sw $v0, 0($t0)
	finalJobs:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		addi $sp, $sp, 12
		jr $ra
exit:

.data
	.align 2
	array: .space 250