.text
.macro find_max($arg1, $arg2)
	add $t7, $arg1, $arg2
	sub $t4, $arg1,$arg2
	sra $t5, $t4, 31
	add $t6, $t5, $t4
	xor $t6, $t5, $t6
	add $t7, $t6, $t7
	sra $t7, $t7, 1
.end_macro

.macro sort()
	sub $s4, $s1, $t7
	sub $s5, $s2, $t7
	sub $s6, $s3, $t7
	srl $t4, $s4, 31
	srl $t5, $s5, 31
	srl $t6, $s6, 31
	mult $s1, $t4
	mflo $s1
	mult $s2, $t5
	mflo $s2
	mult $s3, $t6
	mflo $s3
.end_macro

.globl main

main:
	find_max($s1, $s2)
	add $s4, $zero, $t7
	find_max($s4, $s3)
	add $t3, $zero, $t7
	sort()
	find_max($s1, $s2)
	add $s4, $zero, $t7
	find_max($s4, $s3)
	add $t2, $zero, $t7
	sort()
	find_max($s1, $s2)
	add $s4, $zero, $t7
	find_max($s4, $s3)
	add $t1, $zero, $t7
	