%include "io.inc"

section .data
m dd 35
A db 36
alfa db '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
arr_ptr db 0

section .text
global CMAIN
CMAIN:

mov eax,[m]

; si m = 0 termina
cmp eax,0
jne L1
PRINT_DEC 4,0
jmp end
L1:

; carga en ebx el valor de A
xor ebx,ebx
mov bl,[A]
;carga en edi la direccion de arr_ptr
mov edi, arr_ptr

L3:
cmp eax, 0
jna L2

cdq ;prepara la division
div ebx ;divide entre A
; en eax esta m/a y en edx esta m%a

;escribir m%a en arr_ptr
mov [edi], edx
inc edi
jmp L3

L2: ; fin del while, m <= 0

mov esi,arr_ptr
xor ebx,ebx
mov ecx, alfa
L4:
;imprime los contenidos de esi de atras hacia alante
cmp esi,edi
je end
dec edi
mov bl, [edi]
mov eax, ecx
add eax, ebx
PRINT_CHAR [eax]
jmp L4

end:

ret

