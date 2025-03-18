section .data
	char db "x"
	ln db 0xA
	space db 0x20

section .bss
	x_pos resb 1

section .text
	global rect


rect:

	MOV rbx, rdi
	PUSH rdx
	PUSH rsi
	PUSH rcx

	loop1:

	CMP rbx, 0
	JE Start_2

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, ln
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ loop1

	Start_2:

	POP rbx

	loop2:
	
	POP r12 
	PUSH r12

	loop3:
	
	CMP r12, 0
	JE Start_4
	
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space
	MOV rdi, 1
	syscall

	DEC r12
	JNZ loop3

	Start_4:

	POP rax
	POP r12
	
	PUSH r12 
	PUSH rax 

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

	POP rax
	POP rax
	XOR rax, rax 

	RET

section .note.GNU-stack
