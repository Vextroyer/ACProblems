%include "io.inc"

section .data
i dw 3 ;el numero de entrada
; dos acumuladores para le resultado
a dw 0
b dw 1

section .text
global CMAIN
CMAIN:

mov cx, [i]

;while
beginwhile1:
cmp cx, 0
;n != 0
jz endwhile1
mov ax , [a]
mov bx , [b]
mov [a] , bx
add ax , bx
mov [b] , ax
dec cx
jmp beginwhile1
endwhile1:

PRINT_DEC 2,a

ret

