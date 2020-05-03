## Y tuong: su dung cong thuc tinh nhanh dien tich tu giac trong toa do Oxy	##
##	  									##
## 	S = | [(x1*y2 - y1*x2) + (x2*y3 - y2*x3) .... + (xn*y1 - yn*x1)] / 2 |  ##
## 	Ten: Truong Hoai Nam - MSSV : 1813175					##
##------------------------------------------------------------------------------##
.data
	textAx: .asciiz "+) Nhap hoanh do diem A(xa,ya): xa = "
	textBx: .asciiz "+) Nhap hoanh do diem B(xb,yb): xb = "
	textCx: .asciiz "+) Nhap hoanh do diem C(xc,yc): xc = "
	textDx: .asciiz "+) Nhap hoanh do diem D(xd,yd): xd = "
	textAy: .asciiz "+) Nhap tung do diem A(xa,ya): ya = "
	textBy: .asciiz "+) Nhap tung do diem B(xb,yb): yb = "
	textCy: .asciiz "+) Nhap tung do diem C(xc,yc): yc = "
	textDy: .asciiz "+) Nhap tung do diem D(xd,yd): yd = "
	xa: .float 0
	ya: .float 0
	xb: .float 0
	yb: .float 0
	xc: .float 0
	yc: .float 0
	xd: .float 0
	yd: .float 0
	_2f: .float 2.0
	_ketqua: .float 0.0
	xuatkq: .asciiz " \n\t Dien tich tu giac ABCD thu duoc la: S = "
##------------------------------------------------------------------------------##
.text
     #Nhap toa do diem A(xa,ya)
     	# Nhap hoanh do diem A 
	la $a0,textAx 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,xa
	
	# Nhap tung do diem A 
	la $a0,textAy 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,ya
##------------------------------------------------------------------------------##	
     #Nhap toa do diem B(xb,yb)
     	# Nhap hoanh do diem B
	la $a0,textBx 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,xb
	
	# Nhap tung do diem B 
	la $a0,textBy 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,yb	
##------------------------------------------------------------------------------##	
     #Nhap toa do diem C(xc,yc)
     	# Nhap hoanh do diem C 
	la $a0,textCx 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,xc
	
	# Nhap tung do diem C 
	la $a0,textCy 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,yc
##------------------------------------------------------------------------------##	
     #Nhap toa do diem D(xd,yd)
     	# Nhap hoanh do diem D 
	la $a0,textDx 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,xd
	
	# Nhap tung do diem D
	la $a0,textDy 
	li $v0,4
	syscall
	li $v0,6
	syscall 
	swc1 $f0,yd		
##------------------------------------------------------------------------------##
	# Luu lan luot cac gia tri toa do diem vao cac thanh ghi
	# xa, xb, xc, xd : $f0, $f1, $f2, $f3
	
	lwc1 $f0,xa
	lwc1 $f1,xb
	lwc1 $f2,xc
	lwc1 $f3,xd
	
	# ya, yb, yc, yd : $f4, $f5, $f6, $f7
	
	lwc1 $f4,ya
	lwc1 $f5,yb
	lwc1 $f6,yc
	lwc1 $f7,yd
	
 ## Xu ly tinh dien tich:
 	## Cong thuoc tinh: 										##
 	## 	S = | [(xa*yb - ya*xb) + (xb*yc - yb*xc) + (xc*yd - yc*xd) + (xd*ya - yd*xa)] / 2 |     ##
 	## 		ket qua dien tich la thanh ghi $f10	 					##
 	
 	mul.s $f8,$f0,$f5  ## f8 = xa * yb
 	mul.s $f9,$f1,$f4  ## f9 = xb * ya
 	sub.s $f11,$f8,$f9 ## f11 = f8 - f9
 	
 	mul.s $f8,$f1,$f6  ## f8 = xb * yc
 	mul.s $f9,$f2,$f5  ## f9 = xc * yb
 	sub.s $f12,$f8,$f9 ## f12 = f8 - f9
 	
 	add.s $f10,$f11,$f12 ## f10 = f11 + f12
 	
 	mul.s $f8,$f2,$f7  ## f8 = xc * yd
 	mul.s $f9,$f3,$f6  ## f9 = xd * yc
 	sub.s $f11,$f8,$f9 ## f11 = f8 - f9
 	
 	mul.s $f8,$f3,$f4  ## f8 = xd * ya
 	mul.s $f9,$f0,$f7  ## f9 = xa * yd
 	sub.s $f12,$f8,$f9 ## f12 = f8 - f9
 	
 	add.s $f11,$f11,$f12 ## f10 = f11 + f12
 	add.s $f10,$f10,$f11
 	
 	abs.s $f10,$f10  
 	
 	## load 2.0 vào f11
 	li $v0,6
	lwc1 $f0,_2f
	
	## tinh dien tich hình tu giac
 	div.s $f10,$f10,$f0
 	
     	## luu gia tri dien tích tinh duoc vao bien _ketqua
     	swc1 $f10,_ketqua
##------------------------------------------------------------------------------##
	## In ket qua ra man hinh
   
	li	$v0,4
	la	$a0,xuatkq
	syscall
	
	li $v0,2
	lwc1 $f12,_ketqua
	syscall

##------------------------------------------------------------------------------##
	## Ket thuc chuong trinh
	li $v0,10	
	syscall
