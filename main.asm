section .text
	global _start
	extern print
	extern println
	extern clear

_start:
	CALL clear

	MOV rdi, 4
	MOV rsi, 5
	CALL println
	CALL print

end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	
