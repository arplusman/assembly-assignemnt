.text


.globl main
main:
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0
	addi $v0, $zero, 12
	syscall
	add $s3, $zero , $v0
	
	add $t0, $zero, $zero
	beq $s3, 37, modIncrease
	beq $s3, 47, divIncrease
	beq $s3, 42, mulIncrease
	beq $s3, 45, subIncrease
	beq $s3, 43, addIncrease
	j show_Error
	
	modIncrease:
		addi $t0, $t0, 1
	divIncrease:
		addi $t0, $t0, 1
	mulIncrease:
		addi $t0, $t0, 1
	subIncrease:
		addi $t0, $t0, 1
	addIncrease:
		sll $t0, $t0, 2
	la $t1, JumpTable
	add $t1, $t0, $t1
	lw $t0, 0($t1)
	jr $t0
		
	
	caseAdd:
		add $s2, $s0, $s1
		j show_Result
	caseSub:
		sub $s2, $s0, $s1
		j show_Result
	caseMul:
		mult $s0, $s1
		mflo $s2
		j show_Result
	caseDiv:
		div $s0, $s1
		mflo $s2
		j show_Result
	caseMod:
		div $s0, $s1
		mfhi $s2
		j show_Result
	show_Result:
		addi $v0, $zero, 1
		add $a0, $zero, $s2
		syscall
		j Exit
	show_Error:
		addi $v0, $zero, 4
		la $a0, Error_message
		syscall
	Exit:
.data
	JumpTable:
		.word caseAdd, caseSub, caseMul, caseDiv, caseMod
	Error_message:
		.asciiz "wrong operator"