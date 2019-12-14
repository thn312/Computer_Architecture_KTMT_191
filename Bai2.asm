.data
	str: .asciiz "Nhap so a: "
	str1: .asciiz "Nhap so b: "
	str2: .asciiz "Nhap so c: "

.text
# $t0 -> a; $t3->b; $t4->c

	li  $v0,4
	la  $a0,str
	syscall 
	 
	li $v0,5
	syscall
	move $t0,$v0
####################
	li  $v0,4
	la  $a0,str1
	syscall 
	 
	li $v0,5
	syscall
	move $t3,$v0
#####################
	li  $v0,4
	la  $a0,str2
	syscall 
	 
	li $v0,5
	syscall
	move $t4,$v0
####################

	subi $t1,$t0,-3 # t1 = a - (-3)
	subi $t2,$t0,4 # t2 = a - 4
	
	bge  $t1,$zero,iff
	iff: ble $t2,$zero,true
	
	add $t0,$t3,$t4
	j exit
		
	true: sub $t0,$t3,$t4

	
	exit:
	li $v0,1
	move $a0,$t0
	syscall
	
	add, $v0, $zero, 10
	syscall  
