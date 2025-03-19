section .taxt
	global character
	extern rect

character:

	PUSH rsi
	PUSH rdi
	PUSH rdx

	MOV r8, rdx
	MOV rdx, 4
	MOV rcx, 3
	CALL rect

	POP r8

	POP rdx
	DEC rdx
	MOV rdi, rdx

	POP rsi
	MOV rdx, 4
	MOV rcx, 5
	CALL rect

	RET


section .note.GNU-stack
