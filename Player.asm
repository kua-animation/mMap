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
	
	ret

section .note.GNU-stack	
