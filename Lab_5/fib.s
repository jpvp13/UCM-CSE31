        .data
n:      .word 13
m:	.word 20  # stored at 1001000.4
str1:	.asciiz  "I love CSE31!"  # 0x10010008 , 0x1001000c , 0x100100010,  0x100100014

        .text
main: 	add     $t0, $0, $zero
		addi    $t1, $zero, 1
		la      $t3, n
		lw      $t3, 0($t3)
		
fib: 	beq     $t3, $0, finish
		add     $t2,$t1,$t0
		move    $t0, $t1
		move    $t1, $t2
		subi    $t3, $t3, 1
		j       fib
		
finish: addi    $a0, $t0, 0
		li      $v0, 1		# you will be asked about what the purpose of this line for syscall 
		syscall		
		
				
			#print str1
		la 	$a0, str1
		li 	$v0, 4	
		syscall 
		
						
		li      $v0, 10		
		syscall			

