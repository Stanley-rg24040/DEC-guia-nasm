; Contador regresivo de 9 a 0

section .bss
    buffer resb 2

section .text
    global _start

_start:

    ; Contador inicial
    mov rcx, 9

ciclo:

    ; Convertir número a ASCII
    mov al, cl
    add al, '0'

    ; Guardar en buffer
    mov [buffer], al
    mov byte [buffer+1], 10

    ; Imprimir número
    push rcx              ; guardar RCX

    mov rax, 1            ; syscall write
    mov rdi, 1            ; stdout
    mov rsi, buffer
    mov rdx, 2
    syscall

    pop rcx               ; restaurar RCX

    ; Decrementar contador
    dec rcx
    cmp rcx, -1
    jne ciclo

    ; Salir del programa
    mov rax, 60
    mov rdi, 0
    syscall