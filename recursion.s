        .data

# TPS 2 #3 (statement to be displayed)

Str1:	.asciiz "Please enter a number: "				#register a0 for input and v0 for output

TEST:	.asciiz "TEST"

        .text
main: 		addi $sp, $sp, -4	# Moving stack pointer to make room for storing local variables (push the stack frame)
		
		# TPS 2 #3 (display statement)
		
		li $v0, 4
		la $a0, Str1   #add $v0, $zero, 4
		syscall
#    ________________________________________________		
		# TPS 2 #4 (read user input)	
		li $v0, 5
		syscall
		add $a0, $v0, $zero   #a0 will be used as input argument for recursion
		
		jal recursion	# Call recursion(x)
#    ________________________________________________		
		# TPS 2 #6 (return the answer)
		add $a0, $v0, $zero		#free's up register v0
		li $v0, 1		#will change the value of v0 into 1
		#li $v0, 1
		#add $a0, $t3, $zero
		syscall
		
		
		
		j end		# Jump to end of program


# Implementing recursion
recursion:	addi $sp, $sp, -12	# Push stack frame for local storage

		# TPS 2 #7 
		sw $ra, 0($sp)		#backs up $ra to be able to jump to next recursion call
		
		#li $v0, 4
		#la $a0, TEST   #add $v0, $zero, 4
		#syscall
		
#    ________________________________________________	
	
		addi $t0, $a0, 1			######
		bne $t0, $zero, not_minus_one		#will check if value is equal to 0
#    ________________________________________________	
		
		# TPS 2 #8 (update returned value)
		addi $v0, $zero, 1		 #returns 1
		
		
		
		
		j end_recur
			
not_minus_one:    bne $a0, $zero, not_zero

		# TPS 2 #9 (update returned value)
		addi $v0, $zero, 3			#will return 3 if branch statement is equal to 0
		
		j end_recur		

not_zero:	#li $v0, 4
		#la $a0, Str1   #add $v0, $zero, 4
		#syscall
		
	sw $a0, 4($sp) 	#stores input argument in stack

		# TPS 2 #11 (Prepare new input argument, i.e. m - 2)
		addi $a0, $a0, -2  #new a0 argument (ao - 2)
		jal recursion	# Call recursion(m - 2)
#    ________________________________________________		
			
		# TPS 2 #12 
		#return value is stored at $v0 = recursion(m-2)
		sw $v0, 8($sp)		#backs up return value of a0 into the stack
		
		
#    ________________________________________________			
		# TPS 2 #13 (Prepare new input argument, i.e. m - 1)
		
		
		
		
		lw $a0, 4($sp)		#new argument (a0 - 1)
		addi $a0, $a0, -1  
		jal recursion	# Call recursion(m - 1)
		
#    ________________________________________________			
		# TPS 2 #14 (update returned value)
		#$v0 = $v0 + 8($sp)
		lw $t0, 8($sp)		#retrievs value into temp register
		add $v0, $v0, $t0	#adds the main register of recursion with the temp register to get total
		
		j end_recur
		

# End of recursion function	
end_recur:	# TPS 2 #15 
		lw $ra, 0($sp)

		addi $sp, $sp, 12	# Pop stack frame 
		jr $ra

# Terminating the program
end:	addi $sp, $sp 4	# Moving stack pointer back (pop the stack frame)
		li $v0, 10 
		syscall
