section .data
	rect_ln db 0xA
	space db 0x20

section .text
	global rect


rect:

	MOV rbx, rsi
	PUSH r8
	PUSH rdx
	PUSH rdi
	PUSH rcx

	.loop1:

	CMP rbx, 0
	JE .Start

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, rect_ln
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ .loop1

	.Start:

	POP rbx

	.loop2:
	
	POP r12 
	PUSH r12

	.loop3:
	
	CMP r12, 0
	JE .Start_4
	
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space
	MOV rdi, 1
	syscall

	DEC r12
	JNZ .loop3

	.Start_4:

	POP rax
	POP r12
	POP rsi
	
	PUSH rsi	
	PUSH r12 
	PUSH rax 

	.loop4:

	MOV rax, 1
	MOV rdi, 1
	MOV rdx, 1
	syscall
	
	DEC r12
	JNZ .loop4

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, rect_ln
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ .loop2

	POP rsi
	POP r8
	POP rcx
	
	RET

section .note.GNU-stack
