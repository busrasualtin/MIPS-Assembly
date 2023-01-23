.data
arr:   .word 8, 1, 4, 5, 6, 3, 2, 9, 7, 0
msg: .asciiz "Sorted Array: "

.text
.globl main
main:
	la $s0, arr					# load address of numbers into $s0

	addi $s7, $0, 0					# initialize counter 1 for the first loop
	addi $s6, $0, 9 				# size=10
	
	addi $s1,$0, 0 					# initialize counter 2 for the second loop

	addi $t3,$0, 0					# initialize counter for printing
	addi $t4,$0 10

	


loop:	sll $t7, $s1, 2					# $s1*2 and put it in t7
	add $t7, $s0, $t7 				# add the address of numbers to t7

	lw $t0, 0($t7)  				# load elements [j]	
	lw $t1, 4($t7) 					# load elements [j+1]

	slt $t2, $t0, $t1				#if t0 < t1
	bne $t2, $zero, increase

	#swap part
	sw $t1, 0($t7) 					
	sw $t0, 4($t7)

	

increase:	
	addi $s1, $s1, 1				#s1+1
	sub $s5, $s6, $s7 				#s5=s6-s7

	bne  $s1, $s5, loop				#if s1 not equal 9 go loop
	addi $s7, $s7, 1 				#otherwise s7+1
	li $s1, 0 					#reset s1 to 0

	bne  $s7, $s6, loop				# if s7 not eqaul s6 go loop
	
	
	
	
	# print out message
	addi $v0,$0, 4,					
	la $a0, msg
	syscall
	
	
	
	
print:
	beq $t3, $t4, final				#if t3 = t4 go to final
	
	lw $t5, 0($s0)					# load from numbers
	
	li $v0, 1					# print the number
	move $a0, $t5
	syscall

	
	addi $s0, $s0, 4				#next element
	addi $t3, $t3, 1				#counter+1

	j print
	

final:	
	li $v0, 10					
	syscall
	