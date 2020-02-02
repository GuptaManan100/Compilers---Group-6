section .text
 global _start
_start:
MOV BX, [_ax]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, 5D
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [t1]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_c]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_b]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_b]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_ard]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [t1]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX


	L1:
MOV BX, [_c]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, 0D
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
CMP AX, BX
JLE L2
MOV [t1], AX


	L3:
MOV BX, [_a]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, 0D
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
CMP AX, BX
JLE L4
MOV [t1], AX

MOV BX, [_a]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_a]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_b]
MOV AX, [t2]
MOV AX, BX
MOV [t2], AX

MOV BX, [t2]
MOV AX, [t0]
DIV BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_c]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_c]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, 2D
MOV AX, [t2]
MOV AX, BX
MOV [t2], AX

MOV BX, [t2]
MOV AX, [t1]
MUL BX
MOV [t1], AX

MOV BX, [t1]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

JMP L3

	L4:
JMP L1

	L2:

mov ebx,0
mov eax,1
int 0x80

section .bss
_ax resb 2
t0 resb 2
t1 resb 2
_c resb 2
_b resb 2
_ard resb 2
_a resb 2
t2 resb 2
