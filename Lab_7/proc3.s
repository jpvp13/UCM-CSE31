		.data
x:		.word 5
y:		.word 10
m:		.word 0		
n:		.word 0
p:		.word 0
q:		.word 0
a:		.word 0
b:		.word 0

		.text

		
MAIN:	la $t0, x
		lw $s0, 0($t0)	# s0 = x
		la $t0, y
		lw $s1, 0($t0) 	# s1 = y
		
		# Prepare to call sum(x)
		add $a0, $zero, $s0	# Set a0 as input argument for SUM
		add $a1, $zero, $s1
		
		jal SUM
		
		add $t0, $s1, $s0
		add $s1, $t0, $v0
		addi $a0, $s1, 0 
		
		#print result
		li $v0, 1		 
		syscall	
		j END

		
SUM:	

#Prologue:
	addi $sp, $sp, -4   #pushing stack 3 words down
#     _________________________________
	sw $ra, 8($sp)		#saves RA to MAIN
#     ____________________________________ 	 
 	addi $a0, $s1, 1	# (n+1)
 	addi $a1, $s0, 1	#(m+1)
 	
 	
 	jal SUB
 	add $t0, $zero, $v0	#value of p
 	
 	addi $a0, $s0, -1	#(m-1)
 	addi $a1, $s1, -1	#(n-1)
 	
 	jal SUB
 	
 	add $t1, $zero, $v0
 	
 	
 	
#     ____________________________________ 			
 	lw $ra, 8($sp)		#restore RA to MAIN
 	addi $sp, $sp, 4	#pop stack
 #   _____________________________________		

	add $v0, $t0, $t1		#p + q
	jr $ra
	
			
		
SUB:		
		sub $v0, $a1, $a0
		jr $ra

		
END: 		li $v0, 10
		syscall
		
		
#__________________________________________________________--
#These are test cases that were part of solving the problem

#Epilogue: 
	
	#lw $ra, 8($sp)
	#lw $a0, 4($sp)
	
	#addi $sp, $sp, 8 # pops the stack allocated memory
	
	#jr $ra
	
#SUM:
#la $t0, m
	#lw $a0, 0($t0)		#stores the argument of m
	
	#addi $a0, $a0, 1	#this will do the math inside the arugments

	#la $t0, n
	#lw $a1, 0($t0)		#stores the argument of n
	
	#addi $a1, $a1, 1	#this will do the math inside the arugments

	#la $t0, x
	#lw $s2, 0($t0)		#stores the vlaue of x
	#la $t0, y
	#lw $s3, 0($t0)		#stores the value of y
	
	#la $t0, p
	#lw $s4, 0($t0)		#stores the value of p
	#la $t0, q
	#lw $s5, 0($t0)		#stores the value of q
	
