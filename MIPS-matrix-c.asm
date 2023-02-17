.text
.globl main
main:
	li $v0, 4
	la $a0, welcome_message
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	mult $s0, $s0
	mflo $s1
	move $a0, $s1
	li $v0, 9
	syscall
	move $s2, $v0
	li $v0, 4
	la $a0, read_entries_message
	syscall
	jal readMatrix
	li $v0, 4
	la $a0, reverse_function_message
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	li $v0, 5
	syscall
	move $a1, $v0
	jal reverse
	exit:
		li $v0, 10
		syscall
showMatrix:
	subi $sp, $sp, 20
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	
	sll $t3, $s0, 2
	li $t0, 0
	move $t1, $s2
	slt $t2, $t0, $s0
	beq $t2, 0, breakShowMatrixLoop
	showMatrixLoop:
		move $a0, $t1
		jal showLine
		li $v0, 4
		la $a0, newLine
		syscall
		add $t1, $t1, $t3
		addi $t0, $t0, 1
		slt $t2, $t0, $s0
		beq $t2, 1, showMatrixLoop
	breakShowMatrixLoop:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		lw $t3, 16($sp)
		addi $sp, $sp, 20
		jr $ra
	
	
showLine:
	subi $sp, $sp, 16
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	
	li $t0, 0
	move $t1, $a0
	slt $t2, $t0, $s0
	beq $t2, 0, breakShowLineLoop
	showLineLoop:
		li $v0, 1
		lw $a0, 0($t1)
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $t1, $t1, 4
		addi $t0, $t0, 1
		slt $t2, $t0, $s0
		beq $t2, 1, showLineLoop
	breakShowLineLoop:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		addi $sp, $sp, 16
		jr $ra
readMatrix:
	subi $sp, $sp, 16
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	add $t1, $s2, $zero
	slt $t2, $t0, $s1
	beq $t2, 0, breakReadLoop
	readLoop:
		li $v0, 5
		syscall
		sw $v0, 0($t1)
		addi $t1, $t1, 4
		addi $t0, $t0, 1
		slt $t2, $t0, $s1
		beq $t2, 1, readLoop
	breakReadLoop:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		addi $sp, $sp, 16
		jr $ra
		
multiple:
	subi $sp, $sp, 28
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)
	sw $t5, 24($sp)
	
	li $t0, 0
	move $t1, $a0
	move $t2, $a1
	subi $t1, $t1, 1
	mult $t1, $s0
	mflo $t1
	sll $t1, $t1, 2
	add $t1, $t1, $s2
	slt $t3, $t0, $s0
	beq $t3, 0, breakMultipleLoop
	multipleLoop:
		lw $t4, 0($t1)
		mult $t4, $t2
		mflo $t4
		sw $t4, 0($t1)
		addi $t1, $t1, 4
		addi $t0, $t0, 1
		slt $t3, $t0, $s0
		beq $t3, 1, multipleLoop
	breakMultipleLoop:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		lw $t3, 16($sp)
		lw $t4, 20($sp)
		lw $t5, 24($sp)
		addi $sp, $sp, 28
		jr $ra
decrease:
	subi $sp, $sp, 28
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)
	sw $t5, 24($sp)
	
	li $t0, 0
	move $t1, $a0
	move $t2, $a1
	subi $t1, $t1, 1
	subi $t2, $t2, 1
	mult $t1, $s0
	mflo $t1
	sll $t1, $t1, 2
	mult $t2, $s0
	mflo $t2
	sll $t2, $t2, 2
	add $t1, $t1, $s2
	add $t2, $t2, $s2
	slt $t3, $t0, $s0
	beq $t3, 0, breakDecreaseLoop
	decreaseLoop:
		lw $t4, 0($t1)
		lw $t5, 0($t2)
		sub $t4, $t4, $t5
		sw $t4, 0($t1)
		addi $t1, $t1, 4
		addi $t2, $t2, 4
		addi $t0, $t0, 1
		slt $t3, $t0, $s0
		beq $t3, 1, decreaseLoop
	breakDecreaseLoop:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		lw $t3, 16($sp)
		lw $t4, 20($sp)
		lw $t5, 24($sp)
		addi $sp, $sp, 28
		jr $ra
reverse:
	subi $sp, $sp, 12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	move $t0, $a0
	move $t1, $a1
	jal decrease
	li $a1, -1
	jal multiple
	move $a0, $t1
	move $a1, $t0
	jal decrease
	move $a0, $t0
	li $a1, -1
	jal multiple
	move $a0, $t0
	move $a1, $t1
	jal decrease
	move $a0, $t0
	li $a1, -1
	jal multiple
	jal showMatrix
	
	
.data 
	welcome_message:	.asciiz "Please enter the size of matrix:\n"
	read_entries_message:	.asciiz "Please enter entries:\n"
	reverse_function_message:	.asciiz "Please enter r and s to call reverse function:\n"
	space:		.asciiz " "
	newLine:	.asciiz "\n"
