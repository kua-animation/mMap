section .text
	global _start
	extern set_X_Y, print, clear, rect, sleep
	extern up, down, left, right, clear_rect, reset

_start:

	CALL clear
	
	MOV rdi, delay
	CALL sleep

	MOV rdi, messig
	MOV rsi, 16*2
	CALL print

	MOV rdi, delay
	CALL sleep

	MOV rdi, Char
	MOV rsi, 16*2
	CALL print

	MOV rdi, delay
	CALL sleep

	MOV rax, 0
	MOV rdi, 0
	MOV rsi, mes
	MOV rdx, 4
	syscall

	MOV rdi, delay
	CALL sleep

	CALL clear
	
	MOV rdi, delay
	CALL sleep

	MOV rdi, 2
	MOV rsi, 2
	MOV rdx, 4
	MOV rcx, 3
	MOV r8, mes
	CALL rect
	
	MOV rdi, 3
	MOV rsi, 5
	MOV rdx, 2
	MOV rcx, 1
	MOV r8, mes
	CALL rect

	MOV rdi, 1
	MOV rsi, 6
	MOV rdx, 6
	MOV rcx, 4
	MOV r8, mes
	CALL rect

	MOV rdi, delay
	CALL sleep

	MOV rdi, 6
	CALL up

	MOV rdi, 0
	MOV rsi, 0
	MOV rdx, 4
	MOV rcx, 8
	CALL clear_rect

	MOV rdi, 0
	MOV rsi, 10
	CALL set_X_Y

end_program:
	MOV rax, 60 
	XOR rdi, rdi
	syscall	

section .data
	Char db "Dialog/char.txt", 0
	messig db "Dialog/di.txt", 0
	delay dq 0, 700000000

section .bss
	mes resb 4
	time resb 16


section .note.GNU-stack
