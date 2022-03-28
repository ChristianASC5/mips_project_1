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
