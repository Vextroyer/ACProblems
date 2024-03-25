%include "io.inc"

section .data
; el primo
n dd 1216

section .text
global CMAIN
CMAIN:

; Division
; cdq Extend eax to edx:eax for division
; div b Divide edx:eax by b and store the quotient on eax and the reminder on edx

mov eax, [n]
cdq
mov ebx , 2
div ebx
cmp edx, 0
jnz L1
PRINT_DEC 4,ebx
NEWLINE
L1:

L3:
; divide n by 2
mov eax, [n] ; put n on eax
cdq ; extend eax to edx:eax
mov ebx, 2 ; move the divisor to ebx
div ebx ; divide, the quotient is in eax and the reminder on edx
; 
cmp edx,0 ;Compare the reminder to 0
jnz L2
mov [n], eax ;Set n to be the new quotient
jmp L3 ;repeat
L2:


mov ecx, 3
L7:
mov eax, ecx
mul eax ; multiply eax by eax and put the result in edx:eax
cmp eax, [n]
jg L4 ; si el resultado de la multiplicacion sobrepasa n entonces termina

; si no sobreapsa n hay que comenzar a dividir mientras sea divisor

;comprueba si es divisor e imprime
mov eax, [n]
cdq
div ecx
cmp edx, 0
jnz L5
PRINT_DEC 4,ecx
NEWLINE
L5:

; divide n por i mientras i divida a n
mov eax, [n]
cdq
div ecx
cmp edx, 0
jnz L6
mov [n], eax
jmp L5
L6:

; incrementa ecx y repite
inc ecx
inc ecx
jmp L7

L4:

;comprueba si el ultimo es primo
mov eax, [n]
cmp eax , 1
JNG L8
PRINT_DEC 4,n
L8:

ret

