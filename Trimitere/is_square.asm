%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    push ecx
    mov edi, ecx
    mov ecx, eax
    
    zone:
    
    xor eax, eax
    xor esi, esi

    lower:
    mov eax, esi
    mul esi
    add esi, 1
    cmp eax, [ebx]
    jl lower

    cmp eax, [ebx]
    je square
     
    cmp eax, [ebx]
    jg non_square
    
    square:
    mov dword [edi], 1
    jmp final
   
    non_square:
    mov dword [edi], 0
    jmp final

    final:
    
    add ebx, 4
    add edi, 4
  
    loop zone
  
    pop ecx

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY