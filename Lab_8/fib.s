        .data
#n:      .word 13			#No need to initialize a variable with a set value

Text:	.asciiz "Please enter a number: "

        .text
main: 	
	#print string
	la $v0, 4
	la $a0, Text
	syscall
	
	#Read in Integer from user
	#li $v0, 5		#can load Immediate to acheive same result
	addi $v0, $zero, 5
	syscall
	add $t3, $v0, $zero
	#move $t3, $v0		#can use psuedo to acheive same thing
	

		add     $t0, $0, $zero
		addi    $t1, $zero, 1
		
		#la      $t3, $			# These lines are not needed since we are reading in a integer so we do not need to 
		#lw      $t3, 0($t3)		# load a word or a address into a register.
		
fib: 	beq     $t3, $0, finish
		add     $t2,$t1,$t0
		move    $t0, $t1
		move    $t1, $t2
		subi    $t3, $t3, 1
		j       fib
		
finish: addi    $a0, $t0, 0
		li      $v0, 1		
		syscall			
		li      $v0, 10		
		syscall			

