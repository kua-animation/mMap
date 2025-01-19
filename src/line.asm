section .data
	char db 0xE2, 0x96, 0x88	
	nl db 0xA

section .text
	global drawLine


drawLine:
	
	mov rbx, rdi 

loop: 

	mov rax, 1
	mov rdi, 1
	mov rsi, char
	mov rdx, 3
	syscall

	dec rbx
	cmp rbx, 0 
	jg loop

	ret	

; Explicitly mark the stack as non-executable

section .note.GNU-stack
