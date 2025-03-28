%define sys_write 1
%define stdout 1
%define size 4


section .text
global up, down, left, right, reset, set_X_Y

; function cursor down
up:

CMP rdi, 0
JE ret

MOV rax, rdi

.up_loop:

PUSH rax

; print ecape code cursor up
MOV rax, sys_write
MOV rdi, stdout
MOV rsi, cursor_up
MOV rdx, size
syscall

; for loop calk
POP rax
DEC rax
CMP rax, 0
JNE .up_loop
JMP ret

; function cursor down 
down:

CMP rdi, 0
JE ret

MOV rax, rdi

.down_loop:

PUSH rax

; print ecape code cursor down
MOV rax, sys_write
MOV rdi, stdout
MOV rsi, cursor_down
MOV rdx, size
syscall

; for loop calk
POP rax
DEC rax
CMP rax, 0
JNE .down_loop
JMP ret

; function cursor left
left:

CMP rdi, 0
JE ret

MOV rax, rdi

.left_loop:

PUSH rax

; print ecape code cursor left
MOV rax, sys_write
MOV rdi, stdout
MOV rsi, cursor_left
MOV rdx, size
syscall

; for loop calk
POP rax
DEC rax
CMP rax, 0
JNE .left_loop
JMP ret

; function cursor right
right:

CMP rdi, 0
JE ret

MOV rax, rdi

.right_loop:

PUSH rax

; print ecape code cursor right
MOV rax, sys_write
MOV rdi, stdout
MOV rsi, cursor_right
MOV rdx, size
syscall

; for loop calk
POP rax
DEC rax
CMP rax, 0
JNE .right_loop
JMP ret

reset:

MOV rax, sys_write
MOV rdi, stdout
MOV rsi, cursor_reset
MOV rdx, 3
syscall

JMP ret

set_X_Y:
PUSH rsi

CALL right

POP rdi
CALL down

; return 
ret:
RET

section .data
cursor_up db 0x1b, "[1A"
cursor_down db 0x1b, "[1B"
cursor_left db 0x1b, "[1D"
cursor_right db 0x1b, "[1C"
cursor_reset db 0x1b, "[H"

section .note.GNU-stack
