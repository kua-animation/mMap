section .bss
	global posX
	posX resb 1 
	
	input resb 1
	
section .text
	; declering functions
	extern drawLine
	extern newline
	extern space
	extern clt
	extern DrawPl
	global _start

_start:

	; set posX to 8
	mov rax, [posX]
	mov rax, 8
	mov [posX], rax

loop:

	; set input to NULL
	mov rax, [input]
	xor rax, rax
	mov [input], rax

	; clier terminal
	call clt

	; draw Player
	mov rdi, 6 
	call newline
	call DrawPl
	mov rdi, 2
	call newline

	; getting user input
	mov rax, 0
	mov rdi, 0
	mov rsi, input
	mov rdx, 1
	syscall

	; moving player
	mov rax, [input]
	cmp rax, 'x' 
	je end_program
	cmp rax, 'X' 
	je end_program
	cmp rax, 'd' 
	je right
	cmp rax, 'a'
	je left

	; repite game
	jmp loop 

; if input is a
left:

	mov rax, [posX]
	dec rax
	mov [posX], rax

	jmp loop

; if input is d
right:

	mov rax, [posX]
	inc rax
	mov [posX], rax

	jmp loop 

; if input is x or X
end_program:
	mov rax, 60 
	xor rdi, rdi
	syscall

section .note.GNU-stack
