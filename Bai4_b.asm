.data 
chuoi: .asciiz  "1813175 - TRUONG HOAI NAM"
xuat: .asciiz "Ket qua: "
.text 
	li $v0,4
	la $a0,xuat
	syscall
	
	la $t0,chuoi
	lb $t1,0($t0)
	lb $t2,24($t0)
	
	sb $t2,0($t0)
	sb $t1,24($t0)
	
	li $v0,4
	la $a0,chuoi
	syscall
	
	add, $v0, $zero, 10
	syscall  
