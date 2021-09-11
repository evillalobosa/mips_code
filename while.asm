# print values of array in a WHILE loop
# int v[5] = { 2,4,6,8,10 };
# int suma = 0;
# void main() {
# 	int i = 0;
# 	while(i < 5) {
# 		suma += v[i];
# 		i = i+1;
# 	}
# }

.data
	msg:      .asciiz "Starting \n"
	msg2:     .asciiz "done \n"

	v1:       .asciiz "v["
	v2:       .asciiz "]"
	equal:    .asciiz " = "

	# v[5]..
	suma:    .word 0
	space:   .asciiz "\n"

.text
.globl main
	main:
		la $a0, msg
		li $v0, 4
		syscall		# print message(msg)

		# enter in the while loop
		addi $t0, $zero, 0
		while:
			bgt $t0, 5, exit	# TODO: cambiar 5 por variable

			jal printi		# print v[i]

			add $t0, $t0, 1		# i++
			j while			# go to while tag again
		exit:
			la $a0, msg2
			li $v0, 4
			syscall			# print msg2

		la $a0, 0
		li $v0, 10
		syscall		# exit


	printi:
		la $a0, v1
		li $v0, 4
		syscall			# v[

		li $v0, 1
		add $a0, $t0, $zero
		syscall			# print i

		la $a0, v2
		li $v0, 4
		syscall			# ]

		la $a0, equal
		li $v0, 4
		syscall			# =

		#li $v0, 1
		#add $a0, $t0, $zero
		#syscall			# print v[i]

		li $v0, 4
		la $a0, space
		syscall			# print a new line

		jr $ra			# get back to loop
