.data
	iArray: .word 2, 4, 7, 1, 5, 67, 3, 21, 9, 10
	iArray_size: .word 10
	wrange: .asciiz"range: "
.text
	la $a0, wrange
	li $v0, 4
	syscall
	
	la $a0, iArray
	lw $a1, iArray_size
	jal range
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
##########################################	
range:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	jal max
	addu $t4, $0, $v0
	jal min
	addu $t5, $s0, $v0
	subu $v0, $t4, $t5
	
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	addi $sp, $sp, 4  
	jr $ra

##########################################	
max:
	addi $t0, $0, 0
	lw $t1, ($a0)
condmax:	
	addi $t0, $t0, 1
	bne $t0, $a1, loopmax
	move $v0, $t1
	jr $ra
loopmax: 
	add $a0, $a0, 4
	lw $t2, ($a0)
	sub $t3, $t2, $t1
	bltz $t3, condmax
	addu $t1, $0, $t2
	j condmax
###########################################
min:
	lw $a0, 4($sp)
	addi $t0, $0, 0
	lw $t1, ($a0)
condmin:	
	addi $t0, $t0, 1
	bne $t0, $a1, loopmin
	move $v0, $t1
	jr $ra
loopmin: 
	add $a0, $a0, 4
	lw $t2, ($a0)
	sub $t3, $t2, $t1
	bgtz $t3, condmin
	addu $t1, $0, $t2
	j condmin
##########################################