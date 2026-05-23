; Factorial usando función/subrutina

section .data
    msg db "Factorial: "
    lenMsg equ $ - msg

section .bss
    buffer resb 2

section .text
    global _start

_start:

    ; Número para calcular factorial
    mov rbx, 3

    ; Llamar función
    call calcular_factorial

    ; Convertir resultado a ASCII
    add al, '0'

    mov [buffer], al
    mov byte [buffer+1], 10

    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, lenMsg
    syscall

    ; Mostrar resultado
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 2
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

calcular_factorial:

    mov rax, 1        ; resultado inicial

factorial_loop:

    cmp rbx, 1
    jl fin_factorial

    imul rax, rbx

    dec rbx
    jmp factorial_loop

fin_factorial:
    ret