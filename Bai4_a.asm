.data
	arr: .word 0:11
	str0: .asciiz "Nhap arr[0]: "
	str1: .asciiz "Nhap arr[1]: "
	str2: .asciiz "Nhap arr[2]: "
	str3: .asciiz "Nhap arr[3]: "
	str4: .asciiz "Nhap arr[4]: "
	str5: .asciiz "Nhap arr[5]: "
	str6: .asciiz "Nhap arr[6]: "
	str7: .asciiz "Nhap arr[7]: "
	str8: .asciiz "Nhap arr[8]: "
	str9: .asciiz "Nhap arr[9]: "
	kq: .asciiz "Ket qua: "
	kq1: .asciiz " - "
	kq2: .asciiz " = "
.text
	### arr[0]
	li  $v0,4
	la  $a0,str0
	syscall 
	
	li $v0,5
	la $t0,arr
	syscall
	move $t1,$v0
	sw $t1,0($t0)
	
	### arr[1]
	li  $v0,4
	la  $a0,str1
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,4($t0)
	
	### arr[2]
	li  $v0,4
	la  $a0,str2
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,8($t0)
	
	### arr[3]
	li  $v0,4
	la  $a0,str3
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,12($t0)
	add $t3,$t1,$zero
	### arr[4]
	li  $v0,4
	la  $a0,str4
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,16($t0)
	
	### arr[5]
	li  $v0,4
	la  $a0,str5
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,20($t0)
	
	### arr[6]
	li  $v0,4
	la  $a0,str6
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,24($t0)
	
	### arr[7]
	li  $v0,4
	la  $a0,str7
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	sw $t1,28($t0)
	add $t7,$t1,$zero
	
	### arr[8]
	li  $v0,4
	la  $a0,str8
	syscall 
	
	li $v0,5

	syscall
	move $t1,$v0
	sw $t1,32($t0)
	
	### arr[9]
	li  $v0,4
	la  $a0,str9
	syscall 
	
	li $v0,5
	la $t0,arr
	syscall
	move $t1,$v0
	sw $t1,36($t0)
	
	##########################
	li $v0,4
	la $a0,kq
	syscall
	
	li $v0,1
	move $a0,$t7
	syscall
	
	li $v0,4
	la $a0,kq1
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,kq2
	syscall
	
	li $v0,1
	sub $s0,$t7,$t3
	move $a0,$s0
	syscall
	
	add, $v0, $zero, 10
	syscall  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
