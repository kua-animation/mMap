section .data
	char db "@W@", 0xA
	delay dq 0, 700000000

section .text
	global _start
	extern println
	extern print
	extern clear

_start:

	CALL clear

	MOV rax, 6
	MOV rdi, 12
main:

	PUSH rdi

	MOV rsi, rdi
	MOV rdi, rax
	PUSH rax
	CALL println

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, char
	MOV rdx, 3
	syscall

	MOV rax, 35
	MOV rdi, delay
	MOV rsi, 0
	syscall

	CALL clear

comper:

	POP rax

	POP rdi
	DEC rdi
	
	DEC rax
	CMP rax, 0
	JNE main


end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	


section .note.GNU-stack
