.data 
	str: .asciiz "Computer Architecture CSE-HCMUT"
	str1: .asciiz "Vi tri chu 'u' dau tien trong \""
	str2: .asciiz "\" la: "
	u: .asciiz "u"
.text
	li  $v0,4
	la  $a0,str1
	syscall 
	
	li  $v0,4
	la  $a0,str
	syscall 
	
	li $v0,5
	la $t0,str
	syscall
	move $t1,$v0
	sb $t1,0($t0)
	syscall 
	
	li  $v0,4
	la  $a0,str2
	syscall 
	
	la $t5,u
	
	while: addi $t0,$t0,1
	
	bne $t5,($t0),while
	
	add, $v0, $zero, 10
	syscall  
	
	
	
