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
    

    push  ecx
    push  eax
    


    mov   esi, eax
    mov   edi, eax
    mul   edi
    
    mov   edx, [ebp + 20]
    mov   ecx, eax

    xor edi, edi
    xor eax, eax
    xor esi, esi

    ;; PRINTF32 `%d\n\x0`, ecx
    
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


saritura1:
    ;; PRINTF32 `\n\x0`
    pop   eax
    sub   eax, 1
    push  eax
    xor   esi, esi
    jmp   case2

saritura2:
    ;; PRINTF32 `\n\x0`
    xor   esi, esi
    jmp   case3

saritura3:
    ;; PRINTF32 `\n\x0`
    pop   eax
    sub   eax, 1
    push  eax
    xor   esi, esi
    jmp   case4

saritura4:
    ;; PRINTF32 `\n\x0`
    xor   esi, esi
    jmp   case1


point:
    ;; PRINTF32 `\n\x0`

    pop   eax
    pop   ecx

    
 
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
