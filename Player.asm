section .text
	global DrawPl
	extern drawLine
	extern space
	extern newline
	extern posX

DrawPl:

	;draw line top
	mov rax, [posX]
	add rax, 3
	mov rdi, rax 
	call space	
	mov rdi, 2
	call drawLine
	mov rdi, 1
	call newline

	; draw line middle
	mov rax, [posX]
	add rax, 2 
	mov rdi, rax
	call space
	mov rdi, 4
	call drawLine
	mov rdi, 1
	call newline

	;draw line bottom
	mov rax, [posX]
	add rax, 1
	mov rdi, rax
	call space
	mov rdi, 6
	call drawLine
	mov rdi, 1
	call newline
	
	ret

section .note.GNU-stack	
