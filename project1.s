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
	
	la $s0, input_buffer		#s0 = address of input
	li $s1, 0			        #i(interator) for loop