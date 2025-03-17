section .data
	Char db "Dialog/char.txt", 0
	messig db "Dialog/di.txt", 0
	delay dq 0, 700000000

section .text
	global _start
	extern println
	extern print
	extern clear

_start:

	MOV rdi, messig
	MOV rsi, 16
	CALL print

	MOV rax, 35
	MOV rdi, delay
	MOV rsi, 0
	syscall

	MOV rdi, Char
	MOV rsi, 16
	CALL print

	MOV rax, 35
	MOV rdi, delay
	MOV rsi, 0
	syscall

end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	


section .note.GNU-stack
