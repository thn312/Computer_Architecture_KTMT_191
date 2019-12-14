.data
	
	arr:		.float 4.1, 2.3, 6.9, 8.4, 4.6, 1.3, 4.8, 5.9, 2.9, 3.5
			.float 4.1, 6.3, 8.9, 8.2, 0.6, 7.9, 4.3, 8.2, 7.9, 2.1
			
	str1: 		.asciiz "Phan tu lon nhat la: "
	str2: 		.asciiz "Phan tu nho nhat la: "
#-------------------------------------------------------------------------------------------------------------------#
.text
		la,$a0,arr
		l.s $f12,($a0) ## $f12  =  addr(arr)
		
		
		mfc1 $zero,$f0	## $f0 = 0
		addi $t0,$0,20  ## size of arr
	#--------------------------------------------------------------#
		
	maxloop:   beq $t0,$t1,maxexit
		
		l.s $f3,($a0)
		
		addi $t1,$t1,1
		addi $a0,$a0,4
		
		c.lt.s  $f12,$f3  ## $f12 < $f3 ? 1 : 0 
		bc1f maxloop  ## ==0 => loop
		mov.s $f12,$f3   ## == 1 -> f12 = f3
		
		bne $t0,$t1,maxloop
		
	maxexit:
		la,$a0,str1
		li,$v0,4
		syscall
		
		li,$v0,2
		add.s $f12,$f0,$f12
		syscall	
	
	
#---------------------------------------------------------------------------------------------------# 		
		li $v0,11
		add $a0,$zero,0xA
		syscall
		
		li $t1,0
		la,$a0,arr
		l.s $f12,($a0) ## $f12  =  addr(arr)	
#---------------------------------------------------------------------------------------------------#

		
	minloop:   beq $t0,$t1,minexit
		
		l.s $f3,($a0)
		
		addi $t1,$t1,1
		addi $a0,$a0,4
		
		c.lt.s  $f12,$f3  ## $f12 < $f3 ? 1 : 0 
		bc1t minloop  ## ==1 => loop
		mov.s $f12,$f3   ## == 0 -> f12 = f3 
		
		bne $t0,$t1,minloop
		
	minexit:
		la,$a0,str2
		li,$v0,4
		syscall
		
		li,$v0,2
		add.s $f12,$f0,$f12
		syscall	
		
		
