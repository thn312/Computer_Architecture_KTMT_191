#-------------------------------------------------------------------------------------------------------------------------#
#						CHUONG TRINH CHIA 2 SO THUC						  #
#	Input:	2 so thuc a, b nhap tu ban phim										  #
#	Output:	Ket qua thuong so cua phep chia a/b									  #
# 	** Cac truong hop ngoai le: 											  #
#		Neu so chia hoac so bi chia khong hop le (NaN) thi ket qua la NaN 	#case1				  #
#		Trong truong hop so chia va so bi chia cung bang vo cuc hoac cung bang 0 thi ket qua la NaN #case4 #case5 #
#		Trong truong hop tri tuyet doi cua thuong >= 2^128 thi ket qua la vo cuc (Infinity)	#case3		  #
#		Trong truong hop tri tuyet doi cua thuong <= 2^-127 thi ket qua la 0			#case2		  #
#-------------------------------------------------------------------------------------------------------------------------#

#Khai bao bien:
.data
	float1:		.float	0	#So thuc a (So bi chia)
	float2:		.float	0	#So thuc b (So chia)
	f_ketqua:	.space	8	#luu ket qua (Thuong cua a/b)

#Cau nhac lenh:
	_nhap_1:	.asciiz	"Nhap vao so thuc a = "
	_nhap_2:	.asciiz	"Nhap vao so thuc b = "
	_xuatKQ:	.asciiz	"Ket qua a/b = "

#-------------------------------------------------------------------------------------------------------------------------#
# Phan xu ly chuong trinh
.text

#Nhap du lieu:
#	Voi $f1 luu gia tri so a
#	voi $f2 luu gia tri so b
#
	#Nhap so bi chia (a):
		la	$a0, _nhap_1
		li	$v0, 4
		syscall
		li	$v0, 6
		syscall
		swc1	$f0, float1
	#Nhap so chia (b)
		la	$a0, _nhap_2
		li	$v0, 4
		syscall
		li	$v0, 6
		syscall
		swc1	$f0, float2

	#Chuyen du lieu sang ma nhi phan
		lw	$a1, float1
		lw	$a2, float2
	
	#Kiem tra 2 so da nhap co hop le hay khong (= NaN)
		beq	$a1, 0x7FC00000, case4 # 0x7FC00000 : NaN
		beq	$a2, 0x7FC00000, case4
	
#Xu ly bit dau cua f:
	#Luu lan luot bit dau cua f1, f2 vao $t1, $t2
		andi	$t1, $a1, 0x80000000 # 0x80000000 = 1000 0000 0000 0000 0000 0000 0000 0000
		srl	$t1, $t1, 31 		#trong sign cua so thuc a = $t1
		andi	$t2, $a2, 0x80000000
		srl	$t2, $t2, 31 		#trong sign cua so thuc b = $t2
	
	#Neu bit dau cua f1 va f2 giong nhau thi bit dau cua f la 0 (+) nguoc lai la "-" (1)
	#Bit dau cua thuong so se la phep toan or($t1,$t2). Luu bit dau cua f vao $t0
		or	$t0, $t1, $t2

	#Kiem tra so bi chia co bang cong vo cuc (0x7F800000) / tru vo cuc (0xFF800000) hay khong
		beq	$a1, 0x7F800000, case4
		beq	$a1, 0xFF800000, case4
	
	#Kiem tra so chia co bang 0.0 hoac -0.0 hay khong
		beq	$a2, $zero, case5
		beq	$a2, 0x80000000, case5
	
	#Kiem tra so chia co bang vo cuc hay khong
		beq	$a2, 0x7F800000, case2
		beq	$a2, 0xFF800000, case2
		
#Xu ly cac bit mu cua f:
	#Luu cac bit mu cua f1, f2 vao $t2, $t3
	andi	$t2, $a1, 0x7F800000
	srl	$t2, $t2, 23
	andi	$t3, $a2, 0x7F800000
	srl	$t3, $t3, 23
	
	#Do f = f1 / f2 nen bit mu cua f se bang bit mu cua f1 tru bit mu cua f2
	#Luu bit mu cua f vao $t1
	sub	$t1, $t2, $t3
	
	#Them bias = 127 vao $t1
	addi	$t1, $t1, 127
	
#Xu ly cac bit co so cua f:
	#Luu cac bit co so cua f1, f2 vao $t3, $t4
		andi	$t3, $a1, 0x007FFFFF
		andi	$t4, $a2, 0x007FFFFF
	
	#Them 1 vao bit 24
		ori	$t3, $t3, 0x00800000
		ori	$t4, $t4, 0x00800000

	#Thuc hien phep chia $t3 cho $t4
	#Luu ket qua vao $t2
		li	$t2, 0
loop:		blt	$t3, $t4, next
		addi	$t2, $t2, 1
		sub	$t3, $t3, $t4
		
next:		addi	$t1, $t1, -1
		sll	$t2, $t2, 1
		sll	$t3, $t3, 1
		blt	$t2, 0x007FFFFF, loop
	
	#Sau khi chia, loai bo bit 1 o vi tri bit 24 cua $t2
		andi	$t2, $t2, 0x007FFFFF
	#Cong so mu len 23
		addi	$t1, $t1, 23
	
#Phat hien loi tran so mu:
	#Neu $t1 < 0 hoac $t1 > 255 thi xu li ngoai le
		blt	$t1,$zero, case2
		bgt	$t1, 0xFE, case3

#Gop ket qua thanh so thuc hoan chinh (f)
	#Luu f vao $v0
combine:	li	$v0, 0x0
		or	$v0, $v0, $t0
		sll	$v0, $v0, 8
		or	$v0, $v0, $t1
		sll	$v0, $v0, 23
		or	$v0, $v0, $t2
	#Luu f vao bo nho
save:		sw	$v0, f_ketqua
	
#Xuat ket qua ra man hinh
output:		la	$a0, _xuatKQ
		li	$v0, 4
		syscall
		lwc1	$f12, f_ketqua
		li	$v0, 2
		syscall
		
#Thoat chuong trinh:
exit:		li	$v0, 10
		syscall

#Xu ly ngoai le trong chuong trinh
	#Truong hop thuong mang gia tri khong hop le
case1:		li	$v0, 0x7FC00000
		j	save
	
	#Truong hop tri tuyet doi thuong <= 2^-127
case2:		li	$t1, 0x0
		li	$t2, 0x0
		j	combine
		
	#Truong hop tri tuyet doi thuong >= 2^128
case3:		li	$t1, 0xFF
		li	$t2, 0x0
		j	combine
	#Truong hop so bi chia bang vo cuc
case4:		beq	$a2, 0x7F800000, case1
		beq	$a2, 0xFF800000, case1
		j	case3
	
	#Truong hop so chia bang 0
case5:		beq	$a1, $zero, case1
		beq	$a1, 0xF0000000, case1
		j	case3
	
