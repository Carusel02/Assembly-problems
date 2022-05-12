%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    ;; scadem 1 (len ul e mai mic cu 1)
    sub ecx, 1

zone:
    ;; apelam functia, punem parametrii in ordine inversa pe stiva    
    push ebx
    push eax
    
    ;; !! CLEAN OBLIGATORIU !! deoarece avem garbage pe adresele de distante
    mov dword [ebx], 0
    ;; apelam functia
    extern points_distance
    call points_distance
    ;; modificam varful stivei
    add esp, 8
    
    ;; trecem la urmatorul set de puncte
    add eax, 4
    add ebx, 4
    
    ;; facem asta de ecx ori 
    loop zone

    ;; sub ebx, 4

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY