#Busra Su Altin 19070001018
.data
msg: .asciiz "Result is: "
.text


main:
	addi $a0,$0,6 #initialize a as a0=6
	jal doublefactorial
	addi $v0, $0, 4 # print the message
	la $a0, msg
	syscall
	
	
	addi $v0, $0, 1 #print result
	add $a0, $t0, $0
	syscall
	

doublefactorial:
			bne $a0,$0,else
			bne $a0,1,else
					
			subi $sp,$sp,8 # space on stack
			sw $a0,0($sp) # save n
			sw $ra,4($sp) #save ret addr
			
			
			move $v0, $a0
			j return
			
else: 
	addi $a0,$a0,-2
	
        jal doublefactorial
        mult $v0,$a0
        mflo $v0
        
        
        jr $ra

return:
	lw $a2,0($sp) #restore n
	lw $ra,4($sp) #restore ret addr 	
	addi $sp,$sp,8 # bring back stack pointer
	jr $ra
