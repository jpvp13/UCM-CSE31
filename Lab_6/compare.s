	.data
n:	.word 25

str1:	.asciiz "Less than\n"
str2:	.asciiz "Less than or equal to\n"
str3:	.asciiz "Greater than\n"
str4:	.asciiz "Greater than or equal to\n"

	.text
	
	
	#load n to $s0
	la $t0, n #load adress of temp variable of t0 to the value of n
	lw $s0, 0($t0)  #load word of t0 into s0
	
	
								
	#store user input in $s1
	li $v0, 5 #reads in integer from user
	syscall
									#values are currently stored in s0 and s1
	move $s1, $v0 # moves the value of v0 to s1
	
	
	# s1 < s0	
	#slt	$t0, $s1, $s0  #   t0 = s1 < s0
	
	#if t0 is NOT $zero
	#bne $t0, $zero, LESS #Less than
	
	#if t0 is $zero (s1 >= s0)
	#bne $t0, $zero, GTE  #Greater than or equal to
	
	
	
	slt $t0, $s0, $s1
	# if t0 GREATER THAN $zero (s1 > s0)
	bne $t0, $zero, GT  # Greater than
	
	#If t0 is less than $zero (s1 <= s0)
	bne $t0, $zero, LTE  # Less than or equal too
	
	
	
	
LESS:	
	la $a0, str1  # load address of str1 into a0
	addi $v0, $zero, 4   #add 4 + 0 into v0
	syscall
	
	#termintion 
	j END
	
	
GTE:
	la $a0, str2  # load address of str1 into a0
	addi $v0, $zero, 4   #add 4 + 0 into v0
	syscall
	j END
	
GT:
	la $a0, str3  # load address of str1 into a0
	addi $v0, $zero, 4   #add 4 + 0 into v0
	syscall
	j END
	
LTE:
	la $a0, str4  # load address of str1 into a0
	addi $v0, $zero, 4   #add 4 + 0 into v0
	syscall
	j END




END:
	addi $v0, $zero, 10
	syscall