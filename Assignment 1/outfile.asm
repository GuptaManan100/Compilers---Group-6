section .text
 global _start
_start:
MOV BX, [_a]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, 34D
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [t1]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX


	L1:
MOV BX, [_a]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, 45D
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
CMP AX, BX
JGE L2
MOV [t1], AX

MOV BX, [_a]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_a]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, 1D
MOV AX, [t2]
MOV AX, BX
MOV [t2], AX

MOV BX, [t2]
MOV AX, [t0]
ADD AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

JMP L1

	L2:
MOV BX, [_b]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, 48D
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [t1]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_a]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_b]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
CMP AX, BX
JGE L3
MOV [t1], AX

MOV BX, [_b]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX

MOV BX, [_b]
MOV AX, [t0]
MOV AX, BX
MOV [t0], AX

MOV BX, [_a]
MOV AX, [t2]
MOV AX, BX
MOV [t2], AX

MOV BX, [t2]
MOV AX, [t0]
SUB AX, BX
MOV [t0], AX

MOV BX, [t0]
MOV AX, [t1]
MOV AX, BX
MOV [t1], AX


	L3:

mov ebx,0
mov eax,1
int 0x80

section .bss
t0 resb 2
_a resb 2
t1 resb 2
34 resb 2
45 resb 2
t2 resb 2
1 resb 2
_b resb 2
48 resb 2
