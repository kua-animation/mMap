section .data
	nl db 0xA
	vclt db 0x1B, "[2J", 0x1B, "[H", 0

section .text
	global newline
	global clt


newline:

	mov rbx, rdi

loop:

	mov rax, 1 
	mov rdi, 1
	mov rsi, nl
	mov rdx, 1
	syscall
	
	dec rbx
	cmp rbx, 0
	jg loop

	ret

clt: 
	mov rax, 1
	mov rdi, 1 
	mov rsi, vclt
	mov rdx, 8
	syscall
	
	ret

section .note.GNU-stack
