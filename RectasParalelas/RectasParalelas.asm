%include "io.inc"

section .data
R1 db 1, 1
R2 db -9, 0
P1 db -3, 4
P2 db -2, 27

section .bss
;esto lo tenia hecho antes de poner el input
x11 resd 1
y11 resd 1
x12 resd 1
y12 resd 1
x21 resd 1
y21 resd 1
x22 resd 1
y22 resd 1

dx1 resd 1
dx2 resd 1

dy1 resd 1
dy2 resd 1


section .text
global CMAIN
CMAIN:


; input
;GET_DEC 4, x11
;GET_DEC 4, y11
;GET_DEC 4, x12
;GET_DEC 4, y12
;GET_DEC 4, x21
;GET_DEC 4, y21
;GET_DEC 4, x22
;GET_DEC 4, y22

; preparar las coordenadas
xor eax,eax ; usa eax para realizar las asignaciones
; R1
mov esi,R1
mov al, [esi]
mov [x11], eax
inc esi
mov al, [esi]
mov [y11], eax
;R2
mov esi,R2
mov al, [esi]
mov [x12], eax
inc esi
mov al, [esi]
mov [y12], eax
;P1
mov esi,P1
mov al, [esi]
mov [x21], eax
inc esi
mov al, [esi]
mov [y21], eax
;P2
mov esi,P2
mov al, [esi]
mov [x22], eax
inc esi
mov al, [esi]
mov [y22], eax


; Compute dx1
mov eax,[x11]
sub eax, [x12]
mov [dx1], eax

; Compute dx2
mov eax, [x21]
sub eax, [x22]
mov [dx2], eax

;calcula dy1
mov eax, [y11]
sub eax, [y12]
mov [dy1], eax

;calcula dy2
mov eax, [y21]
sub eax, [y22]
mov [dy2], eax


mov eax, [dx1]
cmp eax, 0
je  L2
mov eax, [dx2]
cmp eax, 0
jne L3

L2:
mov eax, [dx1]
cmp eax, 0
jne L4
mov eax, [dx2]
cmp eax, 0
jne L4
mov eax, 1
jmp L5

L4:
mov eax, 0
jmp L5

L3:
; divide dy1 / dx1
mov eax, [dy1]
cdq
mov ebx, [dx1]
idiv ebx
;guarda el resultado de la division en ecx
mov ecx, eax

; divide dy2 / dx2
mov eax, [dy2]
cdq
mov ebx, [dx2]
idiv ebx

; compara el resultado de la division
cmp ecx, eax
jne L6
mov eax, 1
jmp L5

L6:
mov eax, 0

L5:
xor ebx,ebx ;limpia ebx
cmp eax, 1
jne L7
mov ebx, 'T'
jmp L8

L7:
mov ebx, 'F'
L8:
PRINT_CHAR ebx

ret

