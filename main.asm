section .data
	hello db "Hello x86-64 asm!!", 0xA 
	hello_len equ $ - hello

section .text
	global _start
	extern println
	extern block

_start:
	
	MOV rdi, 5
	MOV rsi, 4
	CALL block

	MOV rdi, 1
	MOV rsi, 3
	CALL block

end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	
