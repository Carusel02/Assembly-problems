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
    
    ;; OMAGA FREESTYLEEEEE

    ;; avem nevoie de stiva xd
    push  ecx
    push  eax
    
    ;; parcurgem matricea de n^2 ori
    mov   esi, eax
    mov   edi, eax
    mul   edi
       
    mov   edx, [ebp + 20]
    mov   ecx, eax
    
    ;; facem clean de siguranta
    xor edi, edi
    xor eax, eax
    xor esi, esi

    ;; formez index in ordine spirala
    ;; pt matrice 3x3 ordinea indexilor ar fi
    ;; 1 2 3 6 9 8 7 4 5

;; parcurgere linie sus matrice
case1: 
    ;; conditie iesire
    cmp    ecx, 0
    je     point
    
    ;; parcurgere index
    add    edi, 1
    add    esi, 1
    sub    ecx, 1
    
    ;; modificare index
    mov    al, [ebx]

    push   ecx
    mov    ecx, [ebp + 16]
    add    al, [ecx + 4 * edi - 4]
    pop    ecx

    mov    [edx], al
    inc    ebx
    inc    edx

    ;; afisare
    ;; PRINTF32 `%d \x0`, edi
    
    ;; verificare
    pop    eax
    push   eax
    cmp    esi, eax
    je     saritura1
   
    jmp    case1

;; parcurgere linie dreapta matrice
case2:
    ;; conditie iesire
    cmp    ecx, 0
    je     point
    
    ;; parcurgere index
    add    edi, [ebp + 8]
    add    esi, 1
    sub    ecx, 1
    
    ;; modificare index
    mov    al, [ebx]
    
    push   ecx
    mov    ecx, [ebp + 16]
    add    al, [ecx + 4 * edi - 4]
    pop    ecx

    mov    [edx], al
    inc    ebx
    inc    edx

    ;; afisare
    ;; PRINTF32 `%d \x0`, edi

    ;; verificare
    pop    eax
    push   eax
    cmp    esi, eax 
    je     saritura2

    jmp    case2

;; parcurgere linie stanga matrice
case3:
    ;; conditie iesire
    cmp    ecx, 0
    je     point
    
    ;; parcurgere index
    sub    edi, 1
    add    esi, 1
    sub    ecx, 1
    
    ;; modificare index
    mov    al, [ebx]
    
    push   ecx
    mov    ecx, [ebp + 16]
    add    al, [ecx + 4 * edi - 4]
    pop    ecx

    mov    [edx], al
    inc    ebx
    inc    edx

    ;; afisare
    ;; PRINTF32 `%d \x0`, edi
    
    ;; verificare
    pop    eax
    push   eax
    cmp    esi, eax
    je     saritura3

    jmp    case3

;; parcurgere linie sus matrice
case4:
    ;; conditie iesire
    cmp    ecx, 0
    je     point
    
    ;; parcurgere index
    sub    edi, [ebp + 8]
    add    esi, 1
    sub    ecx, 1
    
    ;; modificare index
    mov    al, [ebx]
    
    push   ecx
    mov    ecx, [ebp + 16]
    add    al, [ecx + 4 * edi - 4]
    pop    ecx

    mov    [edx], al
    inc    ebx
    inc    edx
    
    ;; afisare
    ;; PRINTF32 `%d \x0`, edi
    
    ;; verificare
    pop    eax
    push   eax
    cmp    esi, eax
    je     saritura4

    jmp    case4


    ;; nr de pasi scade pe parcurs deoarece parcurgerea
    ;; in spirala devine din ce in ce mai "mica"

    ;; facem clean la nr pasi + actualizam nr pasi pt fiecare case

saritura1:
    pop   eax
    sub   eax, 1
    push  eax
    xor   esi, esi
    jmp   case2

saritura2:
    xor   esi, esi
    jmp   case3

saritura3:
    pop   eax
    sub   eax, 1
    push  eax
    xor   esi, esi
    jmp   case4

saritura4:
    xor   esi, esi
    jmp   case1

point:
    ;; zona de final

    ;; scoatem dupa stiva ce am bagat
    pop   eax
    pop   ecx

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
