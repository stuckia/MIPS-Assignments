.data
	str_ask: .asciiz "Enter input string: "
	str_in: .space 256
	pal_true: .asciiz "Yes, input is a palindrome"
	pal_false: .asciiz "No, input is not a palindrome"

.text
	# ask user to input string
	la $a0, str_ask
	li $v0, 4
	syscall
	
	# store input as str_in
	la $a0, str_in
	la $a1, 256
	li $v0, 8
	syscall
	
	# let t0=i=0 for counter
	li $t0, 0
	
	# let s0=str_in address
	la $s0, str_in
	
	loop1:
		# let t1 hold address + counter
		add $t1, $t0, $s0
		lb $t1, 0($t1)
		
		# move on if zero size
		beq $t1, 0, cont
		
		# i++, move to next char of string
		addi $t0, $t0, 1
		j loop1
		
	cont:
		# declare not palindrome if empty
		beq $t0, 1, not_pal
		
		# let t2 hold counter from 0 for first char
		li $t2, 0
		
		# let t3 hold counter at last char
		sub $t3, $t0, 2
		
	loop2:
		bge $t2, $t3, is_pal
		
		# set t4, t5 to the designated char values
		lb $t4, str_in($t2)
		lb $t5, str_in($t3)
		
		# if t4 and t5 are not the same char, not palindrome
		bne $t4, $t5, not_pal
		
		# else check next set of chars
		addi $t2, $t2, 1
		subi $t3, $t3, 1
		j loop2
		
	is_pal:
		# print conclusion of palindrome
		la $a0, pal_true
		li $v0, 4
		syscall
		
		# skip not-pal
		j final
		
	not_pal:
		# print conclusion of non-palindrome
		la $a0, pal_false
		li $v0, 4
		syscall
		
	final:
		# end program
		li $v0, 10
		syscall
		
		