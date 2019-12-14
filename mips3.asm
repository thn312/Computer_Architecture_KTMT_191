
addi $a0, $zero, 100 ##// upper threshold
 addi $a1, $zero, 0 ##// count variable
 add $a2, $zero, $zero ##// sum initialization
 loop:
 beq $a0, $a1, exit
 add $a2, $a2, $a1
 addi $a1, $a1, 1
 j loop
  exit: