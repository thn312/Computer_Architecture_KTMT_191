.data 
	str1: .asciiz "Nhap a: "
	str2: .asciiz "Nhap b: "
	str3: .asciiz "Nhap c: "
	str4: .asciiz "Nhap d: "
	str5: .asciiz "Nhap x: "

	kq: .asciiz  "f(" 
	kq2: .asciiz ") = "

.text
###a
	li  $v0,4
	la  $a0,str1
	syscall 
	 
	li $v0,5
	syscall
	move $t0,$v0
	########################################
###b	
	li  $v0,4
	la  $a0,str2
	syscall 
	 
	li $v0,5
	syscall
	move $t1,$v0
	##########################################
###c
	li  $v0,4
	la  $a0,str3
	syscall 
	 
	li $v0,5
	syscall
	move $t2,$v0
	###########################################
###d
	li  $v0,4
	la  $a0,str4
	syscall 
	 
	li $v0,5
	syscall
	move $t3,$v0
	#############################################

###x

	############################################
	add $t4,$t4,$zero
While:
	addi $t4,$t4,1
	mul $t6,$t4,$t4 # x^2
	mul $t7,$t6,$t4 # x^3
	
	mul $t5,$t0,$t7 # ax^3 -> t5
	mul $t8,$t1,$t6 # bx^2 -> t8
	mul $t6,$t2,$t4 # cx -> t6
	
	add $s0,$t5,$t8
	sub $s0,$s0,$t6
	sub $s0,$s0,$t3
	
	li $v0,4
	la $a0,kq
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,kq2
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	li $v0,11
	addi $a0,$zero,'\n'
	syscall
	
	ble $t4,9,While
	
	add, $v0, $zero, 10
	syscall  
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
