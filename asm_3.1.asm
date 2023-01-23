
.data
arr: .word 7,-4,5,0,8,-2,1,-3
msg: .asciiz "The sum of the positive elements are : "
.text
.globl main
main:
	addi $t0, $0, 0 # t0=i=0
	addi $t1, $0, 0 # t1=sum=0
	ori $t2, $0, 8 # t2= constant 8
	la $t3, arr  # load address of array into t3
	loop:
	slt $t4, $t0, $t2  # compare t0 and t2. t0<=t2 -> t4=0 , t0>t2 -> t4=1
	beq $t4, $0, end  # if i is not < 8, exit the loop
	lw $t4, 0($t3) # load current array element into t4
	bgt $0,$t4, ifcondition #if arr[i]>0, go into if statement 
	add $t1, $t1, $t4  # sum=sum+t4
	
ifcondition:
		add $t0, $t0, 1 # i=i+1
		add $t3, $t3, 4 # increment current array element pointer
	j loop
	
	end:
	
	addi $v0, $0, 4 # print the result (string)
	la $a0, msg
	syscall
	
	addi $v0, $0, 1 # followed by the actual sum (which is in t1)
	add $a0, $t1, $0
	syscall
	jr $ra
