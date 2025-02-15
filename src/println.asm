section .data
	ln db 0xA
	space db 0x20 

section .bss
	printbuf resb 4

section .text
	global println
	global print

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

print:
	PUSH rdx 
	PUSH rsi
	PUSH rcx

	MOV rax, 2
	MOV rsi, 0
	MOV rdx, 0
	syscall

	MOV rdi, rax
	MOV rax, 17 
	MOV rsi, printbuf
	MOV rdx, 1
	POP r10
	syscall

	MOV rax, 17
	POP rsi
	POP rdx
	ADD r10, 2
	syscall

	MOV rax, 3
	syscall

	
	CMP word [printbuf], 0x31
	JNE return

	MOV rax, 1
	MOV rdi, 1
	syscall

	return:

	RET
