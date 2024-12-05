.text
	# init vals
	li $s0, 7
	li $s1, 9
	li $s2, 13

	# compare vals
	bgt $s0, $s1, initcompare
	move $s3, $s1
	b nextcompare

	initcompare:
		move $s3, $s0

	nextcompare:
		bgt $s2, $s3, finalcompare
		move $s4, $s3
		b exit

	finalcompare:
		move $s4, $s2

	exit:
		li $v0, 10
		syscall