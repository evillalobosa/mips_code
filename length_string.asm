# Imprime la longitud de una cadena
#
# C code:
# int longitud(char *s) {
# 	int i = 0;
# 	while(*s != NULL) {
# 		s++;
# 		i++;
#	}
# 	return i;
# }
#
# void main() {
#	char cadena[] = "Esto es una cadena";
# 	int n = longitud(cadena)
# 	printf("La longitud es: %i", n);
# }


.data
	msg:      .asciiz "Starting \n"
	msg2:     .asciiz "\nDone \n"

	string:   .asciiz "parangaricutirimicuaro"
	length:   .asciiz "The length of the string: "
	is:       .asciiz "\nIs: "

.text
.globl main
	main:
		la $a0, msg
		li $v0, 4
		syscall		# Welcome message(msg)

		la $a0, length
		li $v0, 4
		syscall		# print length

		la $a0, string
		li $v0, 4
		syscall		# print string

		la $a0, is
		li $v0, 4
		syscall		# print is

		la $a0, string	# load the string in a0 to calculate the length
		jal strLength	# call strLength procedure

		li $v0, 1
		move $a0, $t0
		syscall		# print int of length saved in t1

		la $a0, msg2
		li $v0, 4
		syscall		# Exit message (msg2)

		la $a0, 0
		li $v0, 10
		syscall		# exit main


	strLength:
		# Function to get length of a string
		li $t0, 0			# initialize the count to zero

		loop:
			lb $t1, 0($a0)		# load the next character into t1
			beqz $t1, exit		# check for the null character
			addi $a0, $a0, 1	# increment the string pointer
			addi $t0, $t0, 1	# increment the count
			j loop			# return to the top of the loop

		exit:
			jr $ra			# get back to main
