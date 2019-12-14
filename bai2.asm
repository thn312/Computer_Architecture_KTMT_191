.data
	str:		.asciiz "Nhap ban kinh duong tron: "
	PI:		.float 3.1415
	str1: 		.asciiz "Dien tich = "
	str2: 		.asciiz "Chu vi = "
	fail:		.asciiz "Phai nhap R >= 0"
.text
		la,$a0,str
		li,$v0,4
		syscall
		
		l.s $f1,PI ##  $f1 = PI = 3.1415
		mfc1 $zero,$f5 ## $f5 = 0
				
		la,$v0,6 ## $f0 -> R
		syscall

		c.lt.s $f0,$f5
		bc1t FAIL
		
		add.s $f3,$f1,$f1 ## f3 = 2pi
		mul.s $f3,$f3,$f0  ## Chu vi = 2pi*R = $f3
		
		mul.s $f4,$f0,$f0
		mul.s $f4,$f4,$f1 ## Dien tich = pi*R^2 = $f4

## IN KET QUA	
		mfc1 $zero,$f5		
		la,$a0,str2
		li,$v0,4
		syscall
		
		li,$v0,2
		add.s $f12,$f5,$f3
		syscall
		
## 		
		li $v0,11
		add $a0,$zero,0xA
		syscall
##
		la,$a0,str1
		li,$v0,4
		syscall
		
		li,$v0,2
		add.s $f12,$f5,$f4
		syscall		
		
		li,$v0,10
		syscall
		
		
FAIL:		la,$a0,fail
		li,$v0,4
		syscall		
		
		li,$v0,10
		syscall
		