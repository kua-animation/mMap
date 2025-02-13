section .data
	cls db "\033c"

section .text
	global clear

clear:

	MOV rax, 1
	MOV rdi, 1
	MOV rdx, cls
	MOV rsi, 5 
	syscall
	
	RET
