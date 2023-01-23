#Busra Su Altin 19070001018
.data
msg: .asciiz "Result is: "
.text



main:
	addi $a0,$0,6 #initialize a as a0=6
	jal fac
	addi $v0, $0, 4 # print the message
	la $a0, msg
	syscall
	
	
	addi $v0, $0, 1 #print result
	add $a0, $t0, $0
	syscall
	

fac:
    move $t4, $t0 #$t0 is the input from the user and $t4 is k in the C code
    li $t1, 1 #$t1 is f in the C code, initialising it to 1
    li $t2, 2 #$t2 is i in the C code, declaring it as 2
    loop:
    bgt $t2, $t4, end_loop #i<=k, end the loop
    mul $t1, $t1, $t2 #f=f*i
    addi $t2, $t2, 2
    j loop
    
    end_loop:
    		jr $ra