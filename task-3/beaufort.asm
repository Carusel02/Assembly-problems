%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    ;; OMAGA FREESTYLEEEE

    ;; bagam in stiva ecx (lungime key)
    push ecx

    mov ecx, eax
    xor eax, eax

zone: 
     xor al,al ; clean
     xor ah,ah ; clean
     
     ;; luam litera plain
     mov     al, [ebx]
     add     ebx, 1
     
     ;; luam litera key
     mov     ah, [edx]
     add     edx, 1
     
     ;; vedem care e mai mare
     cmp     al, ah
     jle     encode2
     
encode1:
     ;; am folosit un algoritm, nu matricea taburet
     ;; se scade din 26 (nr total) diferenta dintre cele 2
     ;; si apoi se adauga 65
     add     ah, 26
     sub     ah, al
     add     ah, 65
     
     ;; se baga in partea encoded
     mov     [esi], ah
     add     esi, 1
     jmp     final
     
encode2:
     ;; algoritmul difera daca litera din plain < litera key
     ;; se afla diferenta dintre cele 2 si se adauga 65
     sub     ah, al
     add     ah, 65
     
     ;; se baga in partea encoded
     mov     [esi], ah
     add     esi, 1
     jmp     final

final:
     
     ;; vedem daca s a terminat key ul 
     pop      edi
     sub      edi, 1
     push     edi
     
     ;; daca da, intram in zona refresh
     cmp      edi, 0
     je       refresh
     
     ;; daca nu, facem iar loop ul
     jmp      repeat

refresh:
     ;; modificam valoarea cu adresa initiala key + len key
     mov      edx, [ebp + 20]
     pop      edi
     mov      edi, [ebp + 16]
     push     edi

repeat:
     ;; repetare iar loop
loop zone
    
    ;; restauram stiva cu pop
    pop ecx

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
