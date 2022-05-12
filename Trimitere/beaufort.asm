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
    
     ;; pop edi
     ;; sub edi, 1
     ;; PRINTF32 `%d\n\x0`, edi
     ;; push edi

    
    push ecx
    mov ecx, eax
    xor eax, eax

zone: 
     xor al,al ; clean
     xor ah,ah ; clean

     mov     al, [ebx]
     add     ebx, 1

     mov     ah, [edx]
     add     edx, 1
     
     cmp     al, ah
     jle      encode2
     



encode1:
     ;; PRINTF32 `encode1\n\x0`
     add     ah, 26
     sub     ah, al
     add     ah, 65
     
     mov     [esi], ah
     add     esi, 1
     jmp     final
     
encode2:
     ;; PRINTF32 `encode2\n\x0`
     sub     ah, al
     add     ah, 65

     mov     [esi], ah
     add     esi, 1
     jmp     final

final:
     
     pop      edi
     sub      edi, 1
     push     edi

     cmp      edi, 0
     je       refresh

     jmp      repeat

refresh:
     ;; PRINTF32 `refresh\n\x0`
     mov      edx, [ebp + 20]
     pop      edi
     mov      edi, [ebp + 16]
     push     edi



repeat:

loop zone

    pop ecx
    


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
