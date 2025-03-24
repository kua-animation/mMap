section .text
	global print, clear, sleep

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

sleep:
	MOV rsi, 0
	MOV rax, 35
	syscall
	
	RET


section .data
	ln db 0xA
	space db 0x20 
	cle db 0x1B, "c"


section .note.GNU-stack
