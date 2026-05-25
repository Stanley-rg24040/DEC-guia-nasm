section .data
    arreglo dw 10, 20, 30, 40, 50

section .bss
    total resw 1       ; aqui se guarda la suma final

section .text
global _start

_start:
    lea rsi, [arreglo] ; Carga la dirección relativa del arreglo en rsi
    mov cx, 5          ; cx es el contador, 5 elementos
    mov ax, 0          ; ax acumula la suma, arranca en 0

ciclo:
    add ax, [rsi]      ; suma el elemento actual al acumulador
    add rsi, 2         ; avanza 2 bytes (16 bits)
    dec cx             ; resta 1 al contador
    jnz ciclo          ; repite el ciclo

    mov [total], ax    ; guarda la suma total en memoria

    mov rax, 60        ; syscall: sys_exit
    mov rdi, 0
    syscall