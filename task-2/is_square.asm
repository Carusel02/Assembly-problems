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
    
    ;; bagam ecx pe stiva
    push ecx
    mov edi, ecx
    mov ecx, eax
    
zone:
    ;; facem un clean de siguranta    
    xor eax, eax
    xor esi, esi

lower:
    ;; facem patratul la un index luat de la 0 
    ;; OBSERVATIE NU MERGE LUAT REGISTRUL EDX (MUL INSTRUCTION)
    mov eax, esi
    mul esi
    ;; crestem indexul
    add esi, 1
    ;; daca numarul e mai mic facem asta iar
    cmp eax, [ebx]
    jl lower
    
    ;; daca numarul e egal trecem in square
    cmp eax, [ebx]
    je square
     
    ;; daca numarul e mai mare trecem in non_square
    cmp eax, [ebx]
    jg non_square

    ;; il marcam ca patrat perfect    
square:
    mov dword [edi], 1
    ;; trecem la urmatoarea iteratie
    jmp final

    ;; il marcam ca nefiind patrat perfect   
non_square:
    mov dword [edi], 0
    ;; trecem la urmatoarea iteratie
    jmp final

    
final:
    ;; zona final incrementeaza adresa vectorii de puncte + distanta
    add ebx, 4
    add edi, 4
  
    loop zone
    
    ;; scoatem ecx ul dupa stiva
    pop ecx

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY