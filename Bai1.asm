.data
	soa: .word 0
	str1: .asciiz "Computer Science and Engineering, HCMUT"
	str2: .asciiz "Computer Architecture 2019" 
	str: .asciiz  "Nhap so a: "
.text
	li $v0,4
	la $a0,str
	syscall
	
	li $v0,5
	syscall
	add $t1,$v0,$zero
	
	andi $t1,$t1,1
	
	beq $t1,$zero,true
	
	li $v0,4
	la $a0,str2
	syscall
	j exit
	
	true:
	li $v0,4
	la $a0,str1
	syscall
	exit:
	
	add, $v0, $zero, 10
	syscall  
	
	
	

