section .data
	rect_ln db 0xA
	space db 0x20

section .text
	;global line
	global rect

rect:

	MOV rax, rcx
	DEC rax
	PUSH rax

	MOV rcx, 1
	PUSH rdx
	PUSH rdi
	CALL line


	POP rdi
	POP rdx
	POP rax
	CMP rax, 0
	JE .Ret
	PUSH rax

	.Loop:

	PUSH rdx
	PUSH rdi

	MOV rsi, 0
	MOV rcx, 1

	CALL line


	POP rdi
	POP rdx
	POP rax

	DEC rax
	PUSH rax

	CMP rax, 0 

	JNE .Loop

	POP rax

	.Ret
	RET

line:

	MOV rbx, rsi
	PUSH rcx
	PUSH rdx 
	PUSH r8
	PUSH rdi

	CMP rbx, 0
	JE .StartX
	
	.loopY:
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, rect_ln
	MOV rdx, 1
	syscall

	DEC rbx
	CMP rbx, 0
	JNE .loopY

	.StartX:
	
	POP rax

	CMP rax, 0
	JE .StartChar

	.loopX:
	PUSH rax

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, space
	MOV rdx, 1
	syscall	

	POP rax
	DEC rax
	CMP rax, 0
	JNE .loopX
	
	.StartChar:
	POP rsi
	POP rax

	.loopChar:
	PUSH rax	
	MOV rax, 1
	MOV rdi, 1
	MOV rdx, 1
	syscall

	POP rax
	DEC rax
	CMP rax, 0
	JNE .loopChar

	POP rax
	CMP rax, 0
	JE .Ret

	MOV rax, 1
	MOV rdi, 1
	MOV rsi, rect_ln
	MOV rdx, 1
	syscall

	.Ret:
	RET

section .note.GNU-stack
