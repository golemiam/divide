    .ORIG x3300 ; Division subroutine
    LD R6, ASCII
    LD R5, NEGASCII
    IN
    ADD R1, R0, #0 ; Move to R1
num1
    ADD R1, R1, R5 ; convert the ASCII to an integer
    IN
    ADD R0, R0, R5 ; Convert the ASCII to an integer
    JSR TWOSCOMP  
    ADD R2, R0, #0 ; Move to R2

num2 
    ADD R7, R7, #0
    ADD R2, R0, R2 ; Convert R2 into 2s compliment
    JSR Eval
    HALT
    BRnzp Done
Eval
    ADD R3, R2, R1 ; Subtract
    ADD R3, R3, #0 ; Set to evaluate
    ADD R4, R4, #1 ; Count up
    BRp Eval
    OUT
    RET
    
    
    
    
ASCII   .FILL x30           ; mask to add to convert to ASCII
NEGASCII .FILL xFFD0         ; negated ASCII maask (-x30)

TWOSCOMP
    NOT R0, R0
    ADD R0, R0, #1
    RET
Done
    .END
