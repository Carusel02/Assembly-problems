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
    
    
    mov ecx, eax                        ;; ecx ia valoarea lui eax
    mov esi, [ebp + 16]                 ;; esi ia valoarea lui ecx

    mov edi, eax                        ;; in edi este pastrata lungimea a N bytes
    mov dword edi, 4
    mul edi
    mov edi, eax
    mov eax, ecx


    label:                              ;; se parcurge conturul matricei

        sub eax, 1

        cmp eax, 0                      ;; daca s-a ajuns la 0, a ramas un singur element 
        je odd_nr                       ;; in mijlocul matricei si este tratat separat

        mov ecx, eax
        linia_1:                        ;; se parcurge prima linie din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain marit
            add ebx, 1
            add esi, 4

        loop linia_1

        mov ecx, eax
        coloana_n:                      ;; se parcurge ultima coloana din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain marit
            add ebx, 1
            add esi, edi

        loop coloana_n

        mov ecx, eax
        linia_n:                        ;; se parcurge ultima linie din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain marit
            add ebx, 1
            sub esi, 4

        loop linia_n
        
        mov ecx, eax
        coloana_1:                      ;; se parcurge prima coloana din contur

            mov edx, [esi]
            add [ebx], edx              ;; numarul se adauga in plain marit
            add ebx, 1
            sub esi, edi

        loop coloana_1

        add esi, edi                    ;; se muta esi pe urmatoarea linie
        add esi, 4                      ;; se muta esi la urmatorul element (pe urmatorul cadran)
        sub eax, 1                      ;; se micsoreaza lungimea liniei

    cmp eax, 0
    jg label
    jle exit

    odd_nr:
        mov edx, [esi]
        add [ebx], edx                  ;; numarul se adauga in plain

    exit:
        mov edx, [ebp + 20]             ;; edx isi reia valoarea initiala
        mov edi, [ebp + 8]              ;; edi ia valoarea N
        mov ebx, [ebp + 12]             ;; edx isi reia valoarea initiala

        copy_plain2:                    

            mov ecx, [ebp + 8]          ;; edi ia valoarea N

            copy_plain:                 ;; se face un loop in loop pentru a avea N^2 iteratii
        
                mov esi, [ebx]
                mov [edx], esi          ;; se mura toate caracterele din plain in enc
                add ebx, 1
                add edx, 1
            
            loop copy_plain

            sub edi, 1
            cmp edi, 0

        jg copy_plain2

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
