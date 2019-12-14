.data
	str: .asciiz "Nhap gia tri a: "
.text
	li  $v0,4
	la  $a0,str
	syscall 
	 
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t7,100 # b =100
	li $t8,2 # c =2
	
	subi $t1,$t0,1
	subi $t2,$t0,2
	subi $t3,$t0,3
	subi $t4,$t0,4
	
	beq $t1,$zero,case1
	beq $t2,$zero,case2
	beq $t3,$zero,case3
	beq $t4,$zero,case4
	
	li $t5,0
	j exit

	
	case1:
	add $t5,$t7,$t8
	j exit
	
	case2:
	sub $t5,$t7,$t8
	j exit
	
	case3:
	mul $t5,$t7,$t8
	j exit
	
	case4:
	div  $t5,$t7,$t8
	j exit
	
	exit:
	li $v0,1
	move $a0,$t5
	syscall
	
	add, $v0, $zero, 10
	syscall  
