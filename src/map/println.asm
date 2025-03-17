section .data
	ln db 0xA
	space db 0x20 
	cle db 0x1B, "c"

section .text
	global println
	global print
	global clear

println:
	
	MOV rbx, rdi
	MOV r12, rsi

	CMP rbx, 0
	JE loop2

	loop1:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, ln 
	MOV rdx, 1
	syscall

	DEC rbx
	JNZ loop1

	CMP r12, 0
	JE return

	loop2:
	
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space 
	MOV rdx, 1
	syscall

	DEC r12 
	JNZ loop2

	return:

	RET

print:
	PUSH rbp
	MOV rbp, rsp
	PUSH rsi 

	MOV rax, 2
	MOV rsi, 0
	syscall

	POP rdx
	SUB rsp, rdx

	MOV rdi, rax
	MOV rax, 0
	MOV rsi, rsp
	syscall	


	MOV rax, 3
	syscall

	
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, rsp
	syscall

	ADD rsp, rdx

	POP rbp
	
	RET
clear:

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, cle
	MOV rdx, 2
	syscall

	RET

section .note.GNU-stack
