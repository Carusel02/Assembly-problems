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
    
    ;; bagam cele 4 puncte (coord x y pt primul si al doilea)
    mov cl, [ebx + point.x]
    mov ch, [ebx + point.y]
    mov dl, [ebx + 4 + point.x]
    mov dh, [ebx + 4 + point.y]
    
    ;; vedem care coordonate sunt egale (stim ca sunt pe aceeasi dreapta)

    ;; comparam coordonatele x
    cmp cl, dl
    je zone1
    
    ;; comparam coordonatele y
    cmp ch, dh
    je zone2


zone1:
    ;; verificam care y e mai mare
    cmp ch, dh
    jl zone1_secundary
    sub ch, dh
    
    ;; stocam
    jmp final1

zone1_secundary:
    ;; scadem
    sub dh, ch
    
    ;; stocam
    jmp final2

zone2:
    ;; verificam care x e mai mare
    cmp cl, dl
    jl zone2_secundary
    sub cl, dl
    
    ;; stocam
    jmp final3

zone2_secundary:
    ;;PRINTF32 `merge zone2_sec!\n\x0`
    sub dl, cl
    
    ;; stocam
    jmp final4

final1:
    ;; facem un clean in eax de siguranta
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov byte [eax], ch
    jmp final

final2:
    xor eax,eax
    mov eax, [ebp + 12]     ; distance

    mov [eax], dh
    jmp final

final3:
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov byte [eax], cl
    jmp final

final4:
    xor eax,eax
    mov eax, [ebp + 12]     ; distance
    
    mov [eax], dl
    jmp final

final:
    ;; facem un clean la toate de siguranta
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