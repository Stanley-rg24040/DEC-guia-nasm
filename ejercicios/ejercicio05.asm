; Mayor de tres números

section .data
    A db 1
    B db 5
    C db 8

    msg db "El mayor es: "
    lenMsg equ $ - msg

section .bss
    mayor  resb 1
    buffer resb 2

section .text
    global _start

_start:

    mov al, [A]

    ; Comparar A con B
    cmp al, [B]
    jge compararC

    ; Si B es mayor
    mov al, [B]

compararC:

    ; Comparar mayor actual con C
    cmp al, [C]
    jge guardarMayor

    ; Si C es mayor
    mov al, [C]

guardarMayor:

    ; Guardar el mayor
    mov [mayor], al

    ; Convertir a ASCII
    add al, '0'

    mov [buffer], al
    mov byte [buffer+1], 10

    
    ; Mostrar mensaje
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, lenMsg
    syscall

    ; Mostrar número mayor
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 2
    syscall

    mov rax, 60
    mov rdi, 0
    syscall