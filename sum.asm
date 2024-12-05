# print sum of number 0-10
.data
	str1: .asciiz "\nEnter a number:\n"
	str2: .asciiz "\nSum:\n"
	temp: .space 4

.text
	# Enter a number:
	li $v0, 4
	la $a0, str1
	syscall

	# read in N
	li $v0, 5
	syscall

	# store N in $t0
	move $t0, $v0

	# jump to sum function
	jal sum

	# store sum into $s1
	move $s1, $v0

	# Sum:
	li $v0, 4
	la $a0, str2
	syscall

	li $v0, 1
	move $a0,$s1
	syscall

	# end code
	li $v0, 10
	syscall

	sum:
		addi $t0, $t0, 1

		li $s0, 0 # s0 = 0
		li $s1, 0 # sum s1 = 0

	loop:
		beq $s0, $t0, exit
		move $a0, $s0
		# add current number to running sum s1
		add $s1, $s1, $a0

		#increment standing number and loop back around
		addi $s0, $s0, 1
		j loop

	exit:
		# return final sum s1
		la $v0, ($s1)
		jr $ra