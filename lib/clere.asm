section .text
global clear_rect
extern rect


clear_rect:

MOV r8, space
CALL rect

ret


section .data
space db 0x20

section .note.GNU-stack
