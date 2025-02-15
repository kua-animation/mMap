section .data
	hello db "Hello.txt", 0
section	.bss
	text resb 6 

section .text
	global _start
	extern println
	extern print

_start:

	MOV rsi, text
	MOV rdi, hello 
	MOV rdx, 6 
	MOV rcx, 0 
	CALL print

end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	
