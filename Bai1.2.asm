.data
	str: .asciiz "Kien truc may tinh 2019"
.text
	li $v0,4
	la $a0,str
	syscall
	
	add, $v0, $zero, 10
	syscall  