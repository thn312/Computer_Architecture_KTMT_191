.data 
	str: .asciiz
	str1: .asciiz "Nhap chuoi 10 ky tu: \n"
	str2: .asciiz "Chuoi ky tu vua nhap la: \n"
.text 
	li $v0,4
	la $a0,str1
	syscall
	#### Nhap ky tu chuoi
	
	li $v0,8
	la $a0,str
	li $a1,11
	syscall

	###
	li $v0,4
	la $a0,str2
	syscall
	#### in chuoi vua nhap

	li $v0,4
	la $a0,str1
	syscall 

	add, $v0, $zero, 10
	syscall  