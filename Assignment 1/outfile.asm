section .text
 global _start
_start:
MOV BX, [b]
MOV AX, [a]
MOV AX, BX
MOV [a], AX

MOV BX, [b]
MOV AX, [a]
ADD AX, BX
MOV [a], AX

MOV BX, [c]
MOV AX, [b]
ADD AX, BX
MOV [b], AX

MOV BX, [b]
MOV AX, [a]
CMP AX, BX
JLE L1
MOV [a], AX

MOV BX, [d]
MOV AX, [c]
MOV AX, BX
MOV [c], AX

MOV BX, [f]
MOV AX, [e]
MOV AX, BX
MOV [e], AX


	L1:

mov ebx,0
mov eax,1
int 0x80

section .bss
a resb 2
b resb 2
c resb 2
d resb 2
e resb 2
f resb 2
