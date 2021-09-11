# print values of array in a DO-WHILE loop
# int v[5] = { 2,4,6,8,10 };
# int suma = 0;
# void main() {
# 	int i = 0;
# 	do {
# 		suma += v[i];
# 		i = i+1;
# 	while (i < 5)
# }

.data
	welcome: .asciiz "Printing array: \n"
	# v[5]..
	suma:    .word 0
	i:       .word 0

.text
.globl main
	main:
		la $a0, welcome
		li $v0, 4
		syscall		# print message

		# do while

		la $a0, 0
		li $v0, 10
		syscall		# exit
