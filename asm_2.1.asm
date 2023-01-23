int arr[9] = {8,1,4,5,6,3,2,9,7};
void main() {
	int i, sum;
	i = 0;
	sum = 0;
	while(i < 9) {
		sum = sum + arr[i];
		i = i+1;
	}
	printf(“result: ”);
	printf(“%d”,sum);
}


.data
arr: .word 8,1,4,5,6,3,2,9,7
msg: .asciiz "The sum of the elements are :"
.text
.globl main
main:
	addi $t0, $0, 0 # i
	addi $t1, $0, 0 # sum
	ori $t2, $0, 9 # t2= constant 9
	la $t3, arr  # load address of array into t3
	loop:
	slt $t4, $t0, $t2  # compare t0 and t2. t0<=t2 -> t4=0 , t0>t2 -> t4=1
	beq $t4, $0, end  # if i is not < 9, exit the loop
	lw $t4, 0($t3) # load current array element into t4
	add $t1, $t1, $t4  # sum=sum+t4
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

	
