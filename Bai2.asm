.data
	str: .asciiz "Ket qua phep toan 100000 + 1000 - 100 la: "
.text
	li $v0,4
	la $a0,str
	syscall
	
	li $t0,100000
	li $t1,1000
	li $t2,100
	add $t0,$t0,$t1
	sub $t0,$t0,$t2
	
	li $v0,1
	move $a0,$t0
	syscall
	
	add, $v0, $zero, 10
	syscall  