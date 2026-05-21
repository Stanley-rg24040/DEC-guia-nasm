;4. Determinación de Par o Impar
;Escriba un programa que tome un número entero almacenado en memoria y determine si es
;par o impar. El programa debe imprimir en pantalla el mensaje correspondiente ("El numero
;es Par" o "El numero es Impar") utilizando las llamadas al sistema (syscalls).
global _start

section .data

    numero db 9 ;numero a verificar que si es par o impar
    es_par db "El numero es Par",10
    long_esPar equ $ - es_par
    es_impar db "El numero es Impar",10
    long_esimPar equ $ - es_impar

section .text


_start:
    mov al, [numero] ;dividendo
    mov bl, 2 ;divisor
    mov ah,0 ;limpiamos el registro ah
    div bl ;el registro ah almacena el residuo de la divicion, si es cero "es par"

    ;determinar si el nuero es par o impar con compare
    cmp ah,0

    ; saltar si es par o impar 
    je mostrar_par   ;je salta si es verdadero
    jne mostrar_impar ;jne salta si es falso

mostrar_par:
        mov rax, 1 ;  con rax 1 llamamos la funcion write
        mov rdi, 1  ; 1 = stdout osea escribir en la terminal
        lea rsi, [es_par] ;"lea" nos guarda la direccion del texto que 
                          ;es espesificamente lo que necesita nuestra funcion write
        mov rdx, long_esPar ;write tambien espera la longitud del texto
        syscall

        jmp fin ; que salte a fin para terminar el programa
        
        
mostrar_impar:
        mov rax, 1
        mov rdi, 1
        lea rsi, [es_impar]
        mov rdx, long_esimPar
        syscall
        jmp fin
        
fin:
    mov rax,60
    mov rdi, 0
    syscall