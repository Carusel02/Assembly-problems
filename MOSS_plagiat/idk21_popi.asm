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

    mov edi, eax
    mov dword eax, 0

    complete_enc:

    label:

    mov ah, [edx]
    mov [esi], ah

    add esi, 1
    add edx, 1

    loop label

    mov edx, [ebp + 20]
    mov ecx, [ebp + 16]
    sub edi, ecx

    ;;PRINTF32 `eax: %d ecx: %d\n\0x`, eax, ecx
    cmp edi, 0
    jle gata

    cmp edi, ecx
    jge complete_enc

    mov ecx, edi
    jmp complete_enc

    gata:

    ;;PRINTF32 `\n\0x`
    mov esi, [ebp + 28]
    mov ecx, [ebp + 8]
    ;;PRINTF32 `%d\n\0x`, ecx

    mov dword eax, 0

    label2:
        ;;PRINTF32 `ebx: %c esi: %c \0x`, [ebx], [esi]

        mov al, [esi]
        cmp al, [ebx]
        jl label3

        sub al, [ebx]
        jmp label4

        label3:
        mov al, [ebx]
        sub al, [esi]
        mov ah, 26
        sub ah, al
        mov al, ah
        ;;mov byte ah, 0

        label4:
        ;;PRINTF32 `%d \0x`, eax

        add byte al, 65
        mov [esi], al

        ;;PRINTF32 `%c\0x`, [esi]

        add esi, 1
        add ebx, 1
        
        ;;PRINTF32 `eax: %c\n\0x`, eax
    loop label2

    ;;PRINTF32 `\n\0x`
    mov esi, [ebp + 28]

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
