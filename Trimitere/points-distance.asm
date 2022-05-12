%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    
    mov cl, [ebx + point.x]
    mov ch, [ebx + point.y]
    mov dl, [ebx + 4 + point.x]
    mov dh, [ebx + 4 + point.y]

    cmp cl, dl
    je zone1
    
    cmp ch, dh
    je zone2


zone1:
    ;;PRINTF32 `merge zone1!\n\x0`
    cmp ch, dh
    jl zone1_secundary
    sub ch, dh
    
    jmp final1

zone1_secundary:
    ;;PRINTF32 `merge zone1_sec!\n\x0`
    sub dh, ch
    
    jmp final2

zone2:
    ;;PRINTF32 `merge zone2!\n\x0`
    cmp cl, dl
    jl zone2_secundary
    sub cl, dl
    
    jmp final3

zone2_secundary:
    ;;PRINTF32 `merge zone2_sec!\n\x0`
    sub dl, cl
    
    jmp final4

final1:
    ;;PRINTF32 `merge f1\n\x0`
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov byte [eax], ch
    jmp final

final2:
    ;;PRINTF32 `merge f2!\n\x0`
    xor eax,eax
    mov eax, [ebp + 12]     ; distance

    mov [eax], dh
    jmp final

final3:
    ;;PRINTF32 `merge f3!\n\x0`
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov byte [eax], cl
    jmp final

final4:
    ;;PRINTF32 `merge f4!\n\x0`
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov [eax], dl
    jmp final

final:
    ;;PRINTF32 `%hu\n\x0`, [eax]

    xor cl,cl
    xor ch,ch
    xor dl,dl
    xor dh,dh

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY