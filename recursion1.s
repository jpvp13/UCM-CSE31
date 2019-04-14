        .data



Str1:	.asciiz "Please enter a integer: "				#register a0 for input and v0 for output
ten:	.word 10
eleven:	.word 11

#TEST:	.asciiz "TEST"

        .text
main: 		addi $sp, $sp, -4	# Moving stack pointer to make room for storing local variables (push the stack frame)
		
		# TPS 2  (display statement)
		
		li $v0, 4  
		la $a0, Str1   #add $v0, $zero, 4
		syscall
#    ________________________________________________		
		# TPS 2  (read user input)	
		li $v0, 5
		syscall
		add $a0, $v0, $zero   #a0 will be used as input argument for recursion
		
		jal recursion	# Call recursion(x)
#    ________________________________________________		
		#  (return the answer)
		add $a0, $v0, $zero		#free's up register v0
		#li $v0, 1		#will change the value of v0 into 1   #addi $v0, $zero, 1
		addi $v0, $zero, 1
		#li $v0, 1
		#add $a0, $t3, $zero
		syscall
		
		
		
		j end		# Jump to end of program


# Implementing recursion
recursion:	addi $sp, $sp, -12	# Push stack frame for local storage

		 
		sw $ra, 0($sp)	###	#backs up $ra to be able to jump to next recursion call
		
		#li $v0, 4
		#la $a0, TEST   #add $v0, $zero, 4
		#syscall
		
		
		
		la $t0, ten
		lw $s0, 0($t0)		#places 10 into s0
#    ________________________________________________	
	
		add $t0, $zero, $a0		#addi t0,a0, 1
		bne $t0, $s0, not_ten		#will check if value is equal to 0
#    ________________________________________________	
		
		# TPS 2  (update returned value)
		addi $v0, $zero, 2		 #returns 2
		
		
		
		
		j end_recur
			
not_ten:    	la $t0, eleven
		lw $s0, 0($t0)

	bne $a0, $s0, not_eleven

		# TPS 2 #9 (update returned value)
		addi $v0, $zero, 1			#will return 1 if branch statement is equal to 0
		
		j end_recur		

not_eleven:	#li $v0, 4
		#la $a0, Str1   #add $v0, $zero, 4
		#syscall
		
	sw $a0, 4($sp) 	#stores input argument in stack#############

		# TPS 2  (Prepare new input argument, i.e. m + 2)
		addi $a0, $a0, 2  #new a0 argument (ao + 2)
		jal recursion	# Call recursion(m - 2)
#    ________________________________________________		
			
		# TPS 2  
		#return value is stored at $v0 = recursion(m+2)
		sw $v0, 8($sp)		#backs up return value of a0 into the stack
		
		
		
		
#    ________________________________________________			
		# TPS 2  (Prepare new input argument, i.e. m + 1)
			
		
		lw $a0, 4($sp)		#new argument (a0 + 1)
		addi $a0, $a0, 1  
		jal recursion	# Call recursion(m + 1)
		
#    ________________________________________________			
		# TPS 2  (update returned value)
		#$v0 = $v0 + 8($sp)
		lw $t0, 8($sp)		#retrievs value into temp register
		lw $s1, 4($sp)
		
		add $v0, $v0, $t0
		add $v0, $v0, $s1
		
		j end_recur
		

# End of recursion function	
end_recur:	# TPS 2  
		lw $ra, 0($sp)

		addi $sp, $sp, 12	# Pop stack frame 
		jr $ra

# Terminating the program
end:	addi $sp, $sp, 4	# Moving stack pointer back (pop the stack frame)
		li $v0, 10 
		syscall
