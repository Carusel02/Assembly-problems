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
    
    ;; PRINTF32 `ADRESA EBX: %p\n\x0`, ebx
    ;; PRINTF32 `ADRESA DIN EBX: %p\n\x0`, [ebx]
    sub ecx, 1

    zone:
    
    push ebx
    push eax
    
    mov dword [ebx], 0
    extern points_distance
    call points_distance
    add esp, 8
    
    ;; PRINTF32 `adresa : %p\n\x0`, ebx
    ;; PRINTF32 `valoare: %hu\n\x0`, [ebx]
    
    add eax, 4
    add ebx, 4
    
    

    loop zone

    ;; sub ebx, 4

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY