section .data

    numero1 db 5 ; db se usa para guardar byte en memoria
    numero2 db 2

section .text
global _start

_start:
    ;cragar los datos desde memoria
    mov al, [numero1] ;con corchetes obtienes el valor loa signamos a "al" que es un subregistro de "rax" de 8 bits
    mov bl, [numero2]

    ;multiplicacion
    mul bl ;multiplica AL × BL y el resultado queda en AX 

    ;divicion entre 2
    mov bl, 2 ;cambiamos el valor de bl para la divicion
    div bl ; el resultado de l divicion se almacena en "al" y el residuo en "ah"

    

    ;salir del programa
    mov rax, 60
    mov rdi, 0
    syscall