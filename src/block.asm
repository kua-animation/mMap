section .data
	char db "x"
	ln db 0xA
	space db 0x20

section .bss
	x_pos resb 1

section .text
	global block


block:

	MOV rbx, rdi
	MOV [x_pos], rsi

	loop1:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, ln
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ loop1

	MOV rbx, 3 

	loop2:

	MOV r12, [x_pos]
	
	loop3:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space
	MOV rdi, 1
	syscall

	DEC r12
	JNZ loop3

	MOV r12, 5 

	loop4:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, char
	MOV rdx, 1
	syscall
	
	DEC r12
	JNZ loop4

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, ln
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ loop2

	RET
