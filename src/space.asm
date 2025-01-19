section .data
	spac db 0x20 

section .text
	global space

space:

	mov rbx, rdi

loop:

	mov rax, 1
	mov rdi, 1
	mov rsi, spac
	mov rdx, 1
	syscall

	dec rbx
	cmp rbx, 0
	jg loop

	ret

section .note.GNU-stack
