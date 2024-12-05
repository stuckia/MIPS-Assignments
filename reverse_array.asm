# program to reverse array and store in new array
.data
	origArr: .word 1, 2, 3, 4, 5
	size: .word 5
	newArr: .space 20
	str1: .asciiz "\nInitial Array:\n"
	str2: .asciiz "\nReversed Array:\n"
	space: .asciiz " "

.text
	#print string1
	li $v0, 4
	la $a0, str1
	syscall

	#print original array from index 0-4
	printorig:
		la $t0, origArr
		lw $s0, size
	
		loop1: beqz $s0, printnew
			lw $s1, 0($t0)
			li $v0, 1
			move $a0, $s1
			syscall
			
			la $a0, space
			li $v0, 4
			syscall

			subi $s0, $s0, 1 #subtract 1 from count
			addi $t0, $t0, 4 # where 4 is bytes the address takes up
			j loop1

	#print new array from index 0-4 as storing reversed values
	printnew:
		li $v0, 4
		la $a0, str2
		syscall

		#point to the array
		la $t0, origArr
		la $t1, newArr
		lw $s0, size #stores non-static num

		loop2: beqz $s0, exit #branch when s0 reaches 0
			#read the array element and print the numbers
			lw $s1, 16($t0) #s1 = origArr[4]
			lw $s2, 0($t1) #s2 = newArr[0]

			sw $s1, 0($t1) #store reversed arr values

			lw $s2, 0($t1)
			li $v0, 1
			move $a0, $s2
			syscall

			#print space between the numbers
			la $a0, space
			li $v0, 4
			syscall

			subi $s0, $s0, 1#subtract 1 from count
			subi $t0, $t0, 4 # where 4 is bytes the address takes up
			addi $t1, $t1, 4
			j loop2

	exit:
		li $v0, 10
		syscall