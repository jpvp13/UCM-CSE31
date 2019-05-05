.data
str0: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars!\n"
# Declare any necessary data here

#Numbers
price:	.word 0
n: 	.word 0
totalMoney:	.word 0
totalBars:	.word 0
#initial:	.word 0
max:		.word 0
totalAmount:	.word 0
totAmount:	.word 0
bars:		.word 0

#Statements
enterPrice:	.asciiz "Please enter the price of a BobCat Bar:\n"
Wrappers:	.asciiz "Please enter the number of wrappers needed to exchange for a new bar:\n"
initialMoney: 	.asciiz	"How, how much do you have?\n"
runNumber:	.asciiz "Good! Let me run the number ...\n"
initialBars1:	.asciiz "You first buy "
initialBars2:	.asciiz " bars!\n"
moreBars1:	.asciiz	"Then, you will get another" 
moreBars2:	.asciiz	" bars!\n"

.text

main:
		#This is the main program.
		#It first asks user to enter the price of each BobCat Bar.
		#It then asks user to enter the number of bar wrappers needed to exchange for a new bar.
		#It then asks user to enter how much money he/she has.
		#It then calls maxBars function to perform calculation of the maximum BobCat Bars the user will receive based on the information entered.
		#It then prints out a statement about the maximum BobCat Bars the user will receive.

		addi $sp, $sp -16	# Feel free to change the increment if you need for space.
		sw $ra, 0($sp)
		# Implement your main here
		
		#print opening statement
		li $v0, 4
		la $a0, str0
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#print enter price
		li $v0, 4
		la $a0, enterPrice
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#received input for price
		li $v0, 5
					
		syscall 
		add $a1, $zero, $v0		#a1 saves input for price
		sw $a0,4($sp)			#stores a0 into stack
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#print wrappers statement
		li $v0, 4
		la $t0, Wrappers
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#received input for wrapper amount
		li $v0, 5
					
		syscall
		add $a2, $zero, $v0		#a2 saves input for wrappers amount
		sw $a1,8($sp)			#stores a1 into stack
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
						
		#print total money amount
		li $v0, 4
		la $a0, initialMoney
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#received input for total money
		li $v0, 5
				
		syscall
		add $a3, $zero, $v0   #a3 saves input for initial money
		sw $a2,12($sp)		#stores a2  into stack
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		
		#print runNumbers 
		li $v0, 4
		la $a0, runNumber
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		
		#add $t1, $zero, 30
		#add $t2, $zero, 5
		
		
		
		#li $v0, 1
		#la $t0, ($a0)
		#syscall 
		
		#print initial bars
		li $v0, 4
		la $a0, initialBars1
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		
		div $t0, $a3, $a1		#t0 = a2/s0 or a0 = totalMoney/price
		sw $t0, 16($sp)			#stores t0 (initial) into stack
		
		li $v0, 1
		la $a0, ($t0)
		syscall
		add $a3, $zero, $a0		#a3 = initial #a1 sets argument a1 as initial
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		
		li $v0, 4
		la $a0, initialBars2
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0

		
		jal maxBars 	# Call maxBars to calculate the maximum number of BobCat Bars


		##########################################################
		#as of rn, a0 has "n", a1 has "price" and a2 has totalMoney
		##########################################################
		
		
		# Print out final statement here



		j end			# Jump to end of program



maxBars:
		# This function calculates the maximum number of BobCat Bars.
		# It takes in 3 arguments ($a0, $a1, $a2) as n(exchange rate), price, and money. It returns the maximum number of bars
		
		addi $sp, $sp -4	#push stack
		sw $ra, 0($sp)		#saves ra for when we use jal
		
		la $t0, max
		add $t4, $zero, $t0		#moves max (t0) to t4
		
		
		
		lw $a3, 16($sp)			#loads initial into t4 
		add $t3, $zero, $a3		#t3 holds initial
		
		lw $a0,4($sp)
		add $t0, $zero, $a0		#loads a0 into t0 
		
		lw $a1, 8($sp)
		add $t1, $zero, $a1		#loads a1 to t1
		
		lw $a2, 12($sp)
		add $t2, $zero, $a2		#loads a2 to t2
		
		
		jal newBars 	# Call a helper function to keep track of the number of bars.
		
		#add $t4, $t3, 
		
		
		jr $ra
		# End of maxBars

newBars:
		# This function calculates the number of BobCat Bars a user will receive based on n.
		# It takes in 2 arguments ($a0, $a1) as number of wrappers left so far and n.
		
		add $t2, $zero, $a3		#t2 has value of a3
		
		
		
		la $t5, bars
		add $s0, $zero, $t5		#moves bars to s0
		
		sw $s0, 4($sp)		#stores s0 into stack
		
		
			####### nned to store t2 into stack and then lw here in newBars so it can be used as argument####
		
		
		beqz $t2, maxBars	#if t2 == 0, branch to maxBars
		beq $t2, $zero, ELSE 	#if t2 == 0 (false) then branch to else block
		



		jr $ra
		# End of newBars
		
		
ELSE:		
		sw $a0, 0($sp)		#store a0 into stack 
		sw $a1, 4($sp)		#store a1 into stack
		
		
		la $t0, totAmount
		add $a2 , $zero, $t0		#moves totAmount into a2
		
		lw $t1, 4($sp)
		
		add $s0, $zero, $t1		#moves bars into s0
		
		
		
		li $v0, 4
		la $t0,	moreBars1
		syscall
		
		li $v0, 4
		la $t0, moreBars2
		syscall
		
	
		
			
				
# End of recursion function	
end_recur:	# TPS 2  
		lw $ra, 0($sp)

		addi $sp, $sp, 16	# Pop stack frame 
		jr $ra						
	

end:
		# Terminating the program
		lw $ra, 0($sp)
		addi $sp, $sp 12
		li $v0, 10
		syscall
