section .data
	Char db "Dialog/char.txt", 0
	messig db "Dialog/di.txt", 0
	delay dq 0, 700000000

section .bss
	mes resb 4

section .text
	global _start
	extern println
	extern print
	extern clear
	extern rect

_start:

	CALL clear
	
	MOV rdi, delay
	CALL sleep

	MOV rdi, messig
	MOV rsi, 16
	CALL print

	MOV rdi, delay
	CALL sleep

	MOV rdi, Char
	MOV rsi, 16
	CALL print

	MOV rdi, delay
	CALL sleep
	CALL sleep

	MOV rax, 0
	MOV rdi, 0
	MOV rsi, mes
	MOV rdx, 4
	syscall

	MOV rdi, 0
	MOV rsi, 1
	MOV rdx, 4
	MOV rcx, 5
	MOV r8, mes
	CALL rect



end_program:
	MOV rax, 60
	XOR rdi, rdi
	syscall	

sleep:
	MOV rsi, 0
	MOV rax, 35
	syscall
	
	RET


section .note.GNU-stack
