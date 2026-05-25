section .data
    multiplicando db 6       ; numero a sumar repetidamente
    multiplicador db 4       ; cuantas veces se suma

section .bss
    resultado resb 1         ; aqui se guarda el resultado

section .text
global _start

_start:
    mov al, [multiplicando]  ; carga el multiplicando en al
    mov cl, [multiplicador]  ; uso de cl como contador del ciclo
    mov bl, 0                ; bl acumula la suma, arranco en 0

    test cl, cl              ; verifica si el multiplicador es 0
    jz fin                   ; si es 0, salta a 'fin' y no entra al ciclo

ciclo:
    add bl, al               ; suma el multiplicando al acumulador
    dec cl                   ; resta 1 al contador
    jnz ciclo                ; si cl no es 0, repite el ciclo

fin:
    mov [resultado], bl      ; guarda el resultado en memoria

    mov rax, 60              ; syscall: sys_exit
    mov rdi, 0               ; status: 0 (éxito)
    syscall