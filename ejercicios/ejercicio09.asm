;9. Inversión de una Cadena de Texto

global _start


section .data
caracter db 0
    mensaje db "UES-FMO",0

section .text

_start:
    mov rsi, mensaje
    mov r8, 0 ;contador para decrementar

recorrer:
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
    jmp recorrer

invertir:
        ;obtener el ultimo caracter
        cmp r8, 0 ; validar si contador es 0
        je fin ;finalizar el programa
        pop rax ;agregar el siguiente caracter a la pila
        mov [caracter], al ;guardamos temporalmente el caracter en memoria
                           ;porque write necesita una direccion de memoria

        ;llamar a la funcion write e imprimir en la terminal
        mov rax, 1 ;llamada a wirte
        mov rdi, 1 ;imprimir en la terminal
        lea rsi, [caracter] ;leer el caracter actual
        mov rdx, 1 ;cantidad de bytes a imprimir por ciclo
        dec r8 ;decrementar el contador
        syscall
        jmp invertir ;bucle

fin:
    mov rax, 60
    mov rdi, 0
    syscall