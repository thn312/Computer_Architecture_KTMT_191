.data
	cArray: .asciiz"Computer Architecture 2019"
	cArray_size: .word 26
.text
main: 
	la $a0, cArray
	lw $a1, cArray_size
	li $t1, 0
	jal reverse
	
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
#######################################	
reverse:
	div $t0, $a1, 2 # $t0 = cArray_size/2	
	add $t1, $0, $0	# $t1 = i =0
	add $t2, $a0, $0		
cond:		
	sub $t4, $t0, $t1
	bgez $t4, loop
	jr $ra
loop:	
	add $t3, $t2, $t1
	lb $t4, 0($t3)
	
	sub $t5, $a1, $t1
	subi $t5, $t5, 1
	add $t6, $t2, $t5
	lb $t7, 0($t6)
	
	sb $t4, 0($t6)
	sb $t7, 0($t3)
	
	add $t1, $t1, 1
	j cond
	
