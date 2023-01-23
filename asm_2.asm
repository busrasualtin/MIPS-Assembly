
.data
arr: .word 1,2,3,4,5,6,7,8,9
msg: .asciiz "Largest element in array is: "
.text
.globl main
main:
	la $s0, arr # starting address of A in $s0 
	li $s1, 9 # number of elements in $s1
	li $s2, 0 # $s2=i=0
	li $s3, 0 # $s3=max=0
	li $s4, -1 # index in $s4
	
loop:
	sll $t1, $s2, 2 # $t1 = i * 4;
	add $t1, $t1, $s0 # $t1 = i * 4 + $s0
	lw $t0, 0($t1) # $t0 = A[i]
	slt $t2, $t0, $s3 # $t2 = 1 if $t0 < $s3. $t2 = 0 if $t0 >= $s3.
	bne $t2, $zero, A # if ($t2 != 0), s3 is still max, goto A
	ori $s3, $t0, 0 # update max value
	ori $s4, $s2, 0 # update max index
	
A:	addi $s2, $s2, 1 # i = i + 1
	bne $s2, $s1, loop # if (i != $s1), go back to loop
	
done: 
	addi $v0, $0, 4 # print the result (string)
	la $a0, msg
	syscall
	
	li $v0, 10
	syscall
	jr $ra
	

	
	
	
