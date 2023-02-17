.text
.macro show_welcome_message()
	la $a0, welcome_message
	addi $v0, $zero, 4
	syscall
.end_macro

.macro show_input_type_message()
	la $a0, input_type_message
	addi $v0, $zero, 4
	syscall
.end_macro

.macro show_planet()
	la $t1, types
	add $t1, $t0, $t1
	add $v0, $zero, 4
	lw $a0, 0($t1)
	syscall
.end_macro

.macro input_number()
	addi $v0, $zero, 5
	syscall
.end_macro

.globl main
main:
	show_welcome_message()
	input_number()
	add $t0, $zero, $v0
	subi $t0, $t0, 1
	sll $t0, $t0, 2
	show_input_type_message()
	input_number()
	add $t0, $t0, $v0
	subi $t0, $t0, 1
	sll $t0, $t0, 2
	show_planet()
.data
	welcome_message:
		.asciiz "Please choose planet type:\ninner\nouter\n" 
	input_type_message:
		.asciiz "Please enter a planet number\n"
	
	mercury:
		.asciiz "Mercury"
	venus:
		.asciiz "Venus"
	earth:
		.asciiz "Earth"
	mars:
		.asciiz "Mars"
	jupiter:
		.asciiz "Jupiter"
	saturn:
		.asciiz "Saturn"
	uranus:
		.asciiz "Uranus"
	neptune:
		.asciiz "Neptune"
	types:
		.word   mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
