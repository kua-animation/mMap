section .data
	ln db 0xA
	space db 0x20 

section .text
	global println

println:
	
	MOV rbx, rdi
	MOV r12, rsi

	loop1:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, ln 
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ loop1

	loop2:
	
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space 
	MOV rdx, 1
	syscall

	DEC r12 
	JNZ loop2

	RET

