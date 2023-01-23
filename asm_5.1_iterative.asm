#Busra Su Altin 19070001018
.data
msg: .asciiz "Sum is : "
.text
.globl main

main:
	add $t0, $t0, $0 # sum=0
	addi $t1, $0, 7 # a=7
	addi $t2, $0, 15 # b=15
	jal addfunc
	
	
addfunc:
	sle $t3, $t1, $t2 # if a <= b , t3=1. if not t3=0
	beq $t3, $0, end  # if a is not <= b, exit the loop.
	add $t0, $t0, $t1 # sum=sum+a
	addi $t1,$t1,1 # a++
	jr $ra
			
end:
	addi $v0, $0, 4 # print the message
	la $a0, msg
	syscall
	
	addi $v0, $0, 1 # followed by the actual sum (which is in t0)
	add $a0, $t0, $0
	syscall
