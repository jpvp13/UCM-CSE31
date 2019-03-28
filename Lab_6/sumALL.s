	.data
num:	.word 4

pos_sum:	.asciiz "Positive Sum: "
neg_sum:	.asciiz "Negative Sum: "

Please: 	.asciiz "Please enter a number: \n"
Pos:		.asciiz "Positive average: \n"
Neg:		.asciiz "Negative average: \n"
Space:		.asciiz "\n"



	.text
main:
	#this section will print out the statement "Please enter a number" for the users guidance
	li $v0, 4
	la $a0, Please
	syscall
	
	
	la $a0, num  #load address of temp variable of t0 to the value of n
	la $a1, num
	
	
	 li $v0, 5 
	syscall
	move $s0, $v0 # moves the outputting value of v0 into a0
	
	
	
	slt $t1, $zero , $s0 #checks if the number is positive
	bne $t1, $zero POS
	
	slt $t1, $s0, $zero # checks if the number is negative
	bne $t1, $zero, NEG
	
	beq $s0, $zero, END #is nunber entered is 0 then program ends

	
POS:
	add $a3, $a3, $s0
	j main 
	
NEG:
	add $s1, $s1, $s0 
	j main
	
#END:	
	#li $v0, 4 #print string
	#la $a0, pos_sum
	
	
	
END:

	li $v0, 4		#will hopefully print out Pos 
	la $a0, pos_sum
	syscall
	
	add $a0, $a3, $zero
	li $v0, 1
	syscall
	
	
	
	
	li $v0, 4		#will print out a space inbetween the outputs
	la $a0, Space
	syscall
	
	
	
	li $v0, 4		#will hopefully print out neg_sum 
	la $a0, neg_sum
	syscall
	add $a0, $s1, $zero
	li $v0, 1
	syscall
	

	
	
	
	
