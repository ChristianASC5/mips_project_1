#PROGRAM: Test Program
#2987639
#N = 32
#M = 22
#beta = 'v'
#delta = 'V'

	.data
	input_buffer: .space 11
	prompt:       .asciiz "Enter Input: "
    .text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, input_buffer
    li $a1, 11
	syscall
	
	la $s0, input_buffer		# s0 = address of input
	li $s1, 0			        # i(interator) for loop
    li $s2, 0			        # output sum
	
loop:
	lb $a0, 0($s0)
	beq $s1, 10, exit
	
inrange09:                      # This section checks if current char is in the range 0-9
	li $t0, '0'
	li $t1, '9'
	blt $a0, $t0, ignore
    bgt $a0, $t1, inrangeAV
	
	sub $a0, $a0, $t0
	add $s2, $s2, $a0
	j ignore

inrangeAV:                      # This section checks if current char is in the range A-V
	li $t0, 'A'
	li $t1, 'V'
	blt $a0, $t0, ignore
    bgt $a0, $t1, inrangeav
	
	subi $a0, $a0, 55
	add $s2, $s2, $a0
	j ignore
	
inrangeav:
	li $t0, 'a'
	li $t1, 'v'
	blt $a0, $t0, ignore
    bgt $a0, $t1, ignore
	
	sub $a0, $a0, 87
	add $s2, $s2, $a0
	j ignore
    
ignore:
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	j loop
	
exit:
	li $v0, 11
	li $a0, 10
	syscall
    	
	li $v0, 1
	move $a0, $s2
	syscall
    	
	li $v0, 10
	syscall