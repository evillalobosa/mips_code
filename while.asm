# Prints the sum and the values of array in a WHILE loop
#
# C code:
# int v[5] = { 2,4,6,8,10 };
# int suma = 0;
# void main() {
# 	int i = 0;
# 	while(i < 5) {
# 		suma += v[i];
# 		i = i+1;
# 	}
# }
#
# NOTE: for printing array values, uncomment line 65

.data
	msg:      .asciiz "Starting \n"
	msg2:     .asciiz "done \n"

	p1:       .asciiz "v["
	p2:       .asciiz "]"
	equal:    .asciiz " = "
	arrow:    .asciiz "   -> "
	space:    .asciiz "\n"

	array:    .space 20	# 5 integer * 4 bytes

.text
.globl main
	main:
		la $a0, msg
		li $v0, 4
		syscall			# print message(msg)

		# set values for array
		addi $s0, $zero, 2	# v[0]
		addi $s1, $zero, 4	# v[1]
		addi $s2, $zero, 6	# v[2]
		addi $s3, $zero, 8	# v[3]
		addi $s4, $zero, 10	# v[4]

		addi $t0, $zero, 0		# clean t0

		# store values in array
		sw $s0, array($t0)
			addi $t0, $t0, 4	# next 4 bytes word
		sw $s1, array($t0)
			addi $t0, $t0, 4	# next 4 bytes word
		sw $s2, array($t0)
			addi $t0, $t0, 4	# next 4 bytes word
		sw $s3, array($t0)
			addi $t0, $t0, 4	# next 4 bytes word
		sw $s4, array($t0)

		# initiating variables for the loop
		addi $t0, $zero, 0		# t0 = 0 (index)
		addi $t1, $zero, 0		# t1 = 0 (suma)
		addi $t6, $zero, 0		# t6 = 0 (v[i])

		# enter in the while loop
		while:
			beq $t0, 20, exit	# if index reaches last element, go to 'exit' tag

			lw $t6, array($t0)	# t6 = v[i]
			#jal printI		# uncomment for print v[i]

			la $a0, arrow
			li $v0, 4
			syscall			# print >

			add $t1, $t1, $t6	# suma += t6
			add $a0, $zero, $t1
			li $v0, 1
			syscall			# print suma

			la $a0, space
			li $v0, 4
			syscall			# print a new line

			add $t0, $t0, 4		# t0 +=4 (next 4 bytes)
			j while			# go to 'while' tag again

		exit:
			la $a0, msg2
			li $v0, 4
			syscall			# print msg2

		la $a0, 0
		li $v0, 10
		syscall		# exit main


	printI:
		# function to print an element of array

		la $a0, p1
		li $v0, 4
		syscall			# v[

		li $v0, 1
		add $a0, $t0, $zero
		syscall			# print index (t0)

		la $a0, p2
		li $v0, 4
		syscall			# ]

		la $a0, equal
		li $v0, 4
		syscall			# =

		add $a0, $t6, $zero
		li $v0, 1
		syscall			# print v[i]

		jr $ra			# get back to loop
