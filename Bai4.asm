.data
	str: .asciiz "Nhap so n: "
.text
# $t0 -> n
	li  $v0,4
	la  $a0,str
	syscall 
	 
	li $v0,5
	syscall
	move $t0,$v0
	
	beq $t0,$zero,exit
	li $t1,1
	beq $t0,$t1,exit
	
	li $t2,0
	add $t4,$t0,$zero
	
	for: add $t0,$t2,$t1
	add $t2,$t1,$zero
	add $t1,$t0,$zero
	
	subi $t4,$t4,1
	
	bge $t4,2,for
	
	j exit
	
	exit:
	li $v0,1
	move $a0,$t0
	syscall
	
	add, $v0, $zero, 10
	syscall  
	
	
	
