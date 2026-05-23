;9. Inversión de una Cadena de Texto

global _start


section .data
caracter db 0
    mensaje db "UES-FMO",0

section .text

_start:
    mov rsi, mensaje
    mov r8, 0
loop:
    ;obtener el primer caracter
    mov al, [rsi]

    ;verificar si legamos al final de la cadena
    cmp al, 0
    je invertir

    ;convertimos AL a un registro mas grande para usar push
    movzx eax, al

    ; agregar el caracter a la pila
    push rax

    ;avanzar hacia la siguiente ubicacion
    inc rsi
    inc r8
    ;repetir proceso
    jmp loop

invertir:
        ;obtener el ultimo caracter
        cmp r8, 0
        je fin
        pop rax
        mov [caracter], al ;guardamos temporalmente el caracter en memoria
                           ;porque write necesita una direccion de memoria
                           
        ;llamar a la funcion write e imprimir en la terminal
        mov rax, 1
        mov rdi, 1
        lea rsi, [caracter]
        mov rdx, 1
        dec r8
        syscall
        jmp invertir





fin:
    mov rax, 60
    mov rdi, 0
    syscall
