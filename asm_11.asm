#Busra Su Altin 19070001018
.data
.text
.globl main
main:
	addi $t0, $t0, 0 #reg0 is always 0
	addi $t1, $t1,14 #reg1 = 14
	addi $t2, $t2, 26 #reg2 = 26
	and $t3, $t1, $t2 #reg3 = reg1 and reg2
	or $t4, $t1, $t2 #reg4 = reg1 or reg2
	add $t5, $t1, $t2 #reg5 = reg1 + reg2
	sub $t6, $t1, $t2 #reg6 = reg1 - reg2
	xor $t7, $t1, $t2 #reg7 = reg1 xor reg2
	
	lui $t9, 0x1001 # Use t9 register as memory start point and set as 0x10010000
	
	sw $t0, 0($t9) #store reg0 to memory location 0
	sw $t1, 4($t9)#store reg1 to memory location 1
	sw $t2, 8($t9) #store reg2 to memory location 2
	sw $t3, 12($t9) #store reg3 to memory location 3
	sw $t4, 16($t9) #store reg4 to memory location 4
	sw $t5, 20($t9) #store reg5 to memory location 5
	sw $t6, 24($t9) #store reg6 to memory location 6
	sw $t7, 28($t9) #store reg7 to memory location 7
	
	