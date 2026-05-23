; Programa: Suma y resta de variables

section .data
    A db 15       
    B db 7        
    C db 3        

section .bss
    Resultado resb 1   ; Reserva 1 byte para el resultado

section .text
    global _start

_start:

    ; Cargar A en AL
    mov al, [A]

    add al, [B]
    sub al, [C]

    ; Guardar el resultado
    mov [Resultado], al

    mov rax, 60     ; syscall: exit
    mov rdi, 0      ; código de salida
    syscall