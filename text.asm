section .data
	time dq 0, 500000000

section .bss
	global posX
	posX resb 1 
	
	input resb 1
	
section .text
	extern drawLine
	extern newline
	extern space
	extern clt
	extern DrawPl
	global _start

_start:

	mov rax, [posX]
	mov rax, 8
	mov [posX], rax

loop:

	mov rax, [input]
	xor rax, rax
	mov [input], rax

	call clt

	mov rdi, 6 

	call newline

	call DrawPl

	mov rax, 0
	mov rdi, 0
	mov rsi, input
	mov rdx, 1
	syscall

	mov rax, [input]

	cmp rax, 'x' 
	je end_program
	cmp rax, 'X' 
	je end_program
	
	cmp rax, 'd' 
	je right

	cmp rax, 'a'
	je left


	jmp loop 

left:
	mov rax, [posX]
	dec rax
	mov [posX], rax

	jmp loop

right:

	mov rax, [posX]
	inc rax
	mov [posX], rax

	jmp loop 

end_program:
	mov rax, 60 
	xor rdi, rdi
	syscall


section .note.GNU-stack
