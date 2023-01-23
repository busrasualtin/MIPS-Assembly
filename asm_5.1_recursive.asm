# Busra Su Altin 19070001018
.data
msg:  .asciiz "Sum is: "
.text

main:   addi $a0,$0,0 # sum = 0
	addi $a1,$0,7 #initialize a as a1=7
	addi $a2,$0,15 #initialize b as a2=15
	jal addfunc
	
	move $a1,$v0
	
	li $v0,4 
	la $a0,msg 
	syscall
	
	li $v0,1
	move $a0,$a1
	syscall
		
	
 end:   li $v0, 10
	syscall	



addfunc:
	subi $sp,$sp,16 # space on stack
	sw $a0,0($sp) # save sum 
	sw $a1,4($sp) #save a
	sw $a2,8($sp) #save b
	sw $ra,12($sp) #save return address
	 	 
	bne $a1,$a2,else
	move $v0, $a1
	j return
else:	
	addi $a1,$a1,1 #a++
	jal addfunc
	lw $a1,4($sp)
	add $a0,$a1,$v0 #sum=a+addfunc()
	move $v0,$a0 #return sum
	

return:	
		
	lw $a0,0($sp) # restore sum 
	lw $a1,4($sp) #restore a
	lw $a2,8($sp) #restore b
	lw $ra,12($sp) #restore return address	
	addi $sp,$sp,16 # bring back stack pointer
	jr $ra
