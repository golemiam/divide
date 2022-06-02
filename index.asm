    .ORIG x3300 ; Division subroutine
    LD R6, ASCII
    LD R5, NEGASCII
    IN
    ADD R1, R0, #0 ; Move to R1
num1
    ADD R1, R1, R5 ; convert the ASCII to an integer
    IN
    ADD R0, R0, R5 ; Convert the ASCII to an integer
    JSR twos_comp    
    ADD R2, R0, #0 ; Move to R2

num2 
    ADD R2, R0, R2 ; Convert R2 into 2s compliment
    JSR Eval
    HALT
    
Eval
    ADD R3, R2, R1 ;
    ADD R3, R3, #0
    BRp Eval
    RET
    
    
    
    
ASCII   .FILL x30           ; mask to add to convert to ASCII
NEGASCII .FILL xFFD0         ; negated ASCII maask (-x30)

twos_comp ; Use R0 as the parameter
    .fill 3100
    
    .END
