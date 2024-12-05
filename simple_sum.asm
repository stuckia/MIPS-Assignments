# print sum of number 0-10
.text
	li $s0, 0 #s0 = 0
	li $s1, 0 # sum s1 = 0

	loop:
		beq $s0, 11, exit
		move $a0, $s0
		#add current number to running sum s1
		add $s1, $s1, $a0

		#increment standing number and loop back around
		addi $s0, $s0, 1
		j loop

	exit:
		# print final sum s1
		li $v0, 1
		move $a0, $s1
		syscall

		# end code
		li $v0, 10
		syscall