;Intercambio de Valores

section .data
    X db 10        ; variable X = 10
    Y db 25        ; variable Y = 25

section .text
global _start

_start:
    mov al, [X]   ; cargo X en al
    mov bl, [Y]   ; cargo Y en bl

    ; intercambio con XOR, sin usar variable extra
    xor al, bl    ; al = al XOR bl
    xor bl, al    ; bl ya tiene el valor original de al
    xor al, bl    ; al ya tiene el valor original de bl

    mov [X], al   ; guardo en X el valor que tenia Y
    mov [Y], bl   ; guardo en Y el valor que tenia X

    mov rax, 60
    mov rdi, 0
    syscall