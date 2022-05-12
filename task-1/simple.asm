%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    ;; declarare zona de tip loop

zone: 
     ;; adaugam intr un registru de 8 biti (din eax) litera din plain
     mov     al, [esi]
     ;; trecem la urmatoarea litera din plain
     inc     esi
     
     ;; adaugam step ul din edx (stocat de fapt in subregistrul dl)
     add     al, dl
     ;; verificam daca am depasit alfabetul (litera Z in ASCII = 90)
     cmp     al, 90
     ;; daca nu l am depasit, sarim in zona move
     jle     move  
     ;; daca da, scadem 26 (literele din alfabet) pentru o noua rotatie  
     sub     al, 26
     
     ;; adaugam in enc_string si incrementam pt urm litera
move:
     mov     [edi], al
     inc     edi

    ;; se repeta de ecx ori (lungimea cuvantului codat)
loop zone

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
