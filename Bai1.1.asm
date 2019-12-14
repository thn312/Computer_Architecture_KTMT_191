.data
	number: .word 0
	str1: .asciiz "Nhap so nguyen a: \n"
	str2: .asciiz "Nhap so nguyen b: \n"
	str3: .asciiz "Nhap so nguyen c: \n"
	str4: .asciiz "Ket qua a-b+c=  "
.text
	li $v0,4
	la $a0,str1
	syscall
	##Nhap a
	li $v0,5
	syscall
	move $t1,$v0
####################################################
	li $v0,4
	la $a0,str2
	syscall
	## Nhap b
	addi $v0,$zero,5
	syscall
	move $t2,$v0
###################################################
	li $v0,4
	la $a0,str3
	syscall
	
	addi $v0,$zero,5 ## : li $v0,5 
	syscall
	move $t3,$v0
####################################################
	li $v0,4
	la $a0,str4
	syscall
	
	subu $t4,$t1,$t2
	addu $t5,$t4,$t3
	
	
	## in ket qua
	li $v0,1
	move $a0,$t5
	syscall
	
	add, $v0, $zero, 10
	syscall       
	
	
		
