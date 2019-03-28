	.data   #delcaring context variables
n:      .word 13   #storing with a single word (int)

        .text 
        
        
add $t1, $s0, 1 #$s0 has the value of 0 in registers, we do not set a initial value for $s0 here but 			#in MARS

add	$t2, $t1, 2

add	$t3, $t2, 3 #iterate each variable once up to add each value plus a number to a new register

add	$t4, $t3, 4

add	$t5, $t4, 5

add	$t6, $t5, 6

add	$t7, $t6, 7
