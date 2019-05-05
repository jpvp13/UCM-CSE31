.data
str0: .asciiz "Welcome to BobCat Candy, home to the famous BobCat Bars!\n"
# Declare any necessary data here

#Statements
enterPrice:	.asciiz "Please enter the price of a BobCat Bar:\n"
Wrappers:	.asciiz "Please enter the number of wrappers needed to exchange for a new bar:\n"
initialMoney: 	.asciiz	"How, how much do you have?\n"
runNumber:	.asciiz "Good! Let me run the number ...\n"
initialBars1:	.asciiz "You first buy "
initialBars2:	.asciiz " bars!\n"
moreBars1:	.asciiz	"Then, you will get another " 
moreBars2:	.asciiz	" bars!\n"



max1:		.asciiz "with $"
max2:		.asciiz ", you will receive a maximum of "
max3:		.asciiz " BobCat bars. \n"
test:		.asciiz "\nTEST\n"



#Numbers
price:		.word 0
n: 		.word 0
totalMoney:	.word 0
totalBars:	.word 0
initial:	.word 0
max:		.word 0
totalAmount:	.word 0
newAmount:	.word 0
bars:		.word 0


.text


main:
		#This is the main program.
		#It first asks user to enter the price of each BobCat Bar.
		#It then asks user to enter the number of bar wrappers needed to exchange for a new bar.
		#It then asks user to enter how much money he/she has.
		#It then calls maxBars function to perform calculation of the maximum BobCat Bars the user will receive based on the information entered.
		#It then prints out a statement about the maximum BobCat Bars the user will receive.

		addi $sp, $sp -40	# Feel free to change the increment if you need for space.
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
		add $a0, $zero, $v0		#a1 saves input for price
		sw $a0,4($sp)			#stores a0 into stack
		
		#add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#print wrappers statement
		li $v0, 4
		la $a0, Wrappers
		syscall
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		#received input for wrapper amount
		li $v0, 5
					
		syscall
		add $a1, $zero, $v0		#a2 saves input for wrappers amount
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
		add $a2, $zero, $v0   #a3 saves input for initial money
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
		
		
		
		add $v0, $v0, $zero 	#cleans v0 to value 0
		
		lw $a0, 4($sp)
		
		div $t0, $a2, $a0		#t0 = a2/s0 or a0 = totalMoney/price (initial)
		
		add $a3, $zero, $t0		#puts value of t0 into a3
		sw $a3, 16($sp)			#stores a3 (initial) into stack
		#sw $a3, 40($sp)		#stack 40 holds a3 == 0
		
		slt $t6, $a3, $a0		#t6 = qoutient < price 
		beq $t6 , 1, print0
		
		#beqz $a3, print
		sw $a3, 40($sp)	#a3 holds a value != 0
		
		#print initial bars
		li $v0, 4
		la $a0, initialBars1
		syscall
		
		li $v0, 1
		la $a0, ($t0)
		syscall
		
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
		
		sw $ra, 20($sp)
		
		lw $a0, 4($sp)
		lw $a1, 8($sp)
		lw $a2, 12($sp)
		lw $a3, 16($sp)
		
		
		
		
		lw $t0, max
		add $t2, $zero, $t0	#t2 holds variable max
		
		lw $t1, totalAmount
		add $t3, $zero, $t1	#t3 holds variable totalAmount
		
		add $a2, $zero, $zero 	#cleans a2
		
		jal newBars
		
print:

		
		li $v0, 4
		la $a0, max1		#with
		syscall
		
		
		li $v0, 1
		lw $a2, 12($sp)				###########
		add $a0, $a2, $zero
		syscall

		add $a2, $zero, $zero		#a2 is clean
		
		
		
		li $v0, 4
		la $a0, max2	#you will receive a maximum of 
		syscall
		
		add $a0, $zero, $zero
		
		lw $a3, 40($sp)
		lw $a0, 4($sp)
		
		#add $a0, $a2, $a3
		
		
		li $v0, 1
		#lw $v0, 28($sp)
		add $a0, $a3,$a0
		syscall
		
		li $v0, 4
		la $a0, max3
		syscall

		lw $ra, 20($sp)
		#jr $ra
		j end
		# End of maxBars
		
print0:

		
		
		
		
		li $v0, 4
		la $a0, max1		#with
		syscall
		
		
		li $v0, 1
		lw $a2, 12($sp)				###########
		add $a0, $a2, $zero
		syscall

		add $a2, $zero, $zero		#a2 is clean
		
		
		
		li $v0, 4
		la $a0, max2	#you will receive a maximum of 
		syscall
		
		add $a0, $zero, $zero
		
		#lw $a3, 40($sp)
		#lw $a0, 4($sp)
		
		#add $a0, $a2, $a3
		
		
		li $v0, 1
		#lw $v0, 28($sp)
		add $a0, $zero,$zero
		syscall
		
		li $v0, 4
		la $a0, max3
		syscall

		lw $ra, 20($sp)
		#jr $ra
		j end
		# End of maxBars
	
newBars:
		# This function calculates the number of BobCat Bars a user will receive based on n.
		# It takes in 2 arguments ($a0, $a1) as number of wrappers left so far and n.
		
		
		#lw $a3, 16($sp)		#loads in initial
		 
		
		#add $a0, $a3, $zero	#moves a3 into a0
		
		lw $a1, 8($sp)		#loads in exchange amount
		
		#add $a1, $a1, $zero
		
		la $t1, bars		#loads bar value
		
		
		add $s0, $t1, $zero	#moves t1 into s0
		
		
		
		#div $t1, $a3, $a1	#div t1= a0/a1
		div $a3, $a1
		mflo $t1
		sw $t1, 24($sp)
		
		
		bnez $t1, not_0		#value is not zero
		
		add $v0, $zero, $zero
		
		jr $ra
		
not_0:


		li $v0, 4
		la $a0, moreBars1
		syscall
		
		
		li $v0, 1
		la $a0, ($t1)
		syscall 
		
		li $v0, 4
		la $a0, moreBars2
		syscall
		
		#add $v0, $v0, $zero		#this will ultimately return the new value of this recursive function
		#sw $v0, 28($sp)
		
		add $a3, $t1, $zero		#new Initial
		
		add $a2, $t1, $a2		#new Amount
		
		move $a0, $a2		#a0 holds a2
		
		sw $a0,4($sp)
		sw $a3, 16($sp)
		#sw $a2, 12($sp)
		
		
		j newBars
		

		
		jr $ra
		# End of newBars
		
		
#		# End of recursion function	

#end_recur:	# TPS 2  
#		lw $ra, 0($sp)
#
#		addi $sp, $sp, 16	# Pop stack frame 
#		jr $ra						
	


equal0:		
		li $v0,0		#returns 0
      		j maxBars
      		
end:
		# Terminating the program
		lw $ra, 0($sp)
		addi $sp, $sp 12
		li $v0, 10
		syscall


	
