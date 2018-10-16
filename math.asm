;Deric Mccadden, A00751277
;2018-09-30

%include "asm_io.inc"

segment .data
prompt_1          db    "Enter digit 1: ", 0
prompt_2          db    "Enter digit 2: ", 0
prompt_3          db    "Enter digit 3: ", 0
prompt_4          db    "Enter digit 4: ", 0
prompt_5          db    "Enter digit 5: ", 0
prompt_6          db    "Enter digit 6: ", 0
prompt_7          db    "Enter digit 7: ", 0
prompt_8          db    "Enter digit 8: ", 0
prompt_9          db    "Enter digit 9: ", 0
prompt_10         db    "Enter digit 10: ", 0
prompt_11         db    "Enter digit 11: ", 0
final_message     db    "Full UPC Code: ", 0

segment .bss
digit_1   resd 1
digit_2   resd 1
digit_3   resd 1
digit_4   resd 1
digit_5   resd 1
digit_6   resd 1
digit_7   resd 1
digit_8   resd 1
digit_9   resd 1
digit_10  resd 1
digit_11  resd 1
digit_C   resd 1

segment .text
global  asm_main

asm_main:
        enter   0,0               ; setup routine
        pusha

        ;read 11 digits
        mov     eax, prompt_1
        call    print_string
        call    read_int
        mov     [digit_1], eax

        mov     eax, prompt_2
        call    print_string
        call    read_int
        mov     [digit_2], eax

        mov     eax, prompt_3
        call    print_string
        call    read_int
        mov     [digit_3], eax

        mov     eax, prompt_4
        call    print_string
        call    read_int
        mov     [digit_4], eax

        mov     eax, prompt_5
        call    print_string
        call    read_int
        mov     [digit_5], eax

        mov     eax, prompt_6
        call    print_string
        call    read_int
        mov     [digit_6], eax

        mov     eax, prompt_7
        call    print_string
        call    read_int
        mov     [digit_7], eax

        mov     eax, prompt_8
        call    print_string
        call    read_int
        mov     [digit_8], eax

        mov     eax, prompt_9
        call    print_string
        call    read_int
        mov     [digit_9], eax

        mov     eax, prompt_10
        call    print_string
        call    read_int
        mov     [digit_10], eax

        mov     eax, prompt_11
        call    print_string
        call    read_int
        mov     [digit_11], eax

        ;Step 1 Sum odd digits
        mov     eax, [digit_1]
        add     eax, [digit_3]
        add     eax, [digit_5]
        add     eax, [digit_7]
        add     eax, [digit_9]
        add     eax, [digit_11]

        ;Step 2 Multiply result by 3
        imul    eax, 3

        ;Step 3 Add even digits
        add    eax, [digit_2]
        add    eax, [digit_4]
        add    eax, [digit_6]
        add    eax, [digit_8]
        add    eax, [digit_10]

        ;Step 4 Mod by 10
        cdq
        mov     ecx, 10
        idiv    ecx
        mov     eax, edx ;eax==M

        ;Step 5 if(M==0) continue else M=10-M
        cmp    eax, 0 ;eax==M
        je     Yes
        mov    ebx, eax
        mov    eax, 10
        sub    eax, ebx
        Yes:
        mov    [digit_C], eax

        ;print message
        mov     ebx, eax
        mov     eax, final_message
        call    print_string
        ;print full UPC
        mov     eax, [digit_1]
        call    print_int
        mov     eax, [digit_2]
        call    print_int
        mov     eax, [digit_3]
        call    print_int
        mov     eax, [digit_4]
        call    print_int
        mov     eax, [digit_5]
        call    print_int
        mov     eax, [digit_6]
        call    print_int
        mov     eax, [digit_7]
        call    print_int
        mov     eax, [digit_8]
        call    print_int
        mov     eax, [digit_9]
        call    print_int
        mov     eax, [digit_10]
        call    print_int
        mov     eax, [digit_11]
        call    print_int
        mov     eax, [digit_C]
        call    print_int
        call    print_nl

        popa
        mov     eax, 0            ; return back to C
        leave
        ret
