.data
arr1: .word 5, -1, 4, -6, 0, 8, -3, 7
arr2: .word 0, 0, 0, 0, 0
.text
.globl main

main:
	add $t0, $t0, $0 # i=0
	addi $t1, $0, 8 # t1 = arr1 size
	la $t2, arr1 # load address of arr1 into t2
	la $t3, arr2 # load address of arr2 into t3
loop:
	ble $t1, $t0, print # i use ble for using slt and beq ...
	lw $a0, 0($t2) # load current array element into a0
	jal test # call test function

	sw $v0, 0($t3) # store inverse of the arr1[i] into arr2[i]
	addi $t0, $t0, 1 # i=i+1
	addi $t2, $t2, 4 # increment current arr1 element pointer		
	addi $t3, $t3, 4 # increment current arr2 element pointer		
	j loop 
	
test: 
	slt $t4, $0, $t2 # if 0<t2 -> t4=1 else t4=0
	beq $t4, $0, end  # if i is not < 8, exit the loop	
	add $v0, $zero, $t4 #return inverse number
	jr $ra


print:
	add $t0, $0, $0  # initialize i = 0
	addi $t1, $0, 5 # t1= size of arr2
	la $t3, arr2 # load address of arr2 into t3
	loop1:
	ble $t1, $t0, end  # i use ble for using slt and beq ...
	# slt  $t5, $t0, $t1  # compare t0 and t1.if t0<t1 -> t5=1,else t5=0
	# beq $t5, $0, end  # if i is not < 5, exit the loop	
	
	li $v0, 1
	lw $a0, 0($t3) # load current array element into a0
	syscall 
	
	li $a0, 32  #printing space between numbers
	li $v0, 11
	syscall
	
	addi $t0, $t0, 1 # i=i+1
	addi $t3, $t3, 4 # increment current arr2 element pointer		
	j loop1

	

end:		
	li $v0, 10
	syscall				
