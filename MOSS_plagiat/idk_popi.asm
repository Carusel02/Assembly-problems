%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    mov edi, eax
    mov ecx, eax

    ;;PRINTF32 `\n%d\n\0x`, ecx 

    mov esi, [ebp + 16]

    mov eax, [ebp + 8]
    mov ecx, eax

    mov dword edi, 4
    mul edi
    mov edi, eax
    mov eax, ecx


    label:

        sub eax, 1

        cmp eax, 0
        je odd_nr

        mov ecx, eax
       
        linia_1:
            mov edx, [esi]
            add [ebx], edx
            ;;PRINTF32 `%c \0x`, [ebx]
            add ebx, 1
            add esi, 4
        loop linia_1

        ;;PRINTF32 `\n\0x`

        mov ecx, eax
        coloana_n:
            mov edx, [esi]
            add [ebx], edx
            ;;PRINTF32 `%c \0x`, [ebx]
            add ebx, 1
            add esi, edi
        loop coloana_n
        
        ;;PRINTF32 `\n\0x`

        mov ecx, eax
        linia_n:
            mov edx, [esi]
            add [ebx], edx
            ;;PRINTF32 `%c \0x`, [ebx]
            add ebx, 1
            sub esi, 4
        loop linia_n

        ;;PRINTF32 `\n\0x`
        
        mov ecx, eax
        coloana_1:
            mov edx, [esi]
            add [ebx], edx
            ;;PRINTF32 `%c \0x`, [ebx]
            add ebx, 1
            sub esi, edi
        loop coloana_1
        
        ;;PRINTF32 `\n\0x`

        add esi, edi
        add esi, 4
        sub eax, 1

    cmp eax, 0
    jg label
    jle exit

    odd_nr:
        mov edx, [esi]
        add [ebx], edx
        ;;PRINTF32 `%c \0x`, [ebx]

    exit:
        mov edx, [ebp + 20]
        mov edi, [ebp + 8]
        mov ebx, [ebp + 12]

        copy_plain2:
            mov ecx, [ebp + 8]
            copy_plain:
        
                mov esi, [ebx]
                mov [edx], esi
                ;;PRINTF32 `%c\0x`, [edx]
                add ebx, 1
                add edx, 1
            
            loop copy_plain
            sub edi, 1
            cmp edi, 0
            ;;PRINTF32 `ecx %d edi %d\n\0x`, ecx, edi 
        jg copy_plain2
    
        mov edx, [ebp + 20]

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
