; Luhn algorithm
.MODEL SMALL
.STACK 100
; INCLUDE macros.asm
.DATA
    ; cardNum     DB "4263982640269299"
    ; cardNum DB 16 dup (0)
    cardNum     DB 4,2,6,3,9,8,2,6,4,0,2,6,9,2,9,9 ; 90, VALID
    ; cardNum     DB 4,0,0,1,9,1,9,2,5,7,5,3,7,1,9,3 ; 60, VALID
    ; cardNum     DB 2,2,2,9,0,1,0,1,2,2,8,6,1,1,0,7 ; 50, VALID
    ; cardNum     DB 4,3,8,8,5,7,6,0,1,8,4,0,2,6,2,6 ; 75, FAILED
    ; cardNum     DB 4,9,9,9,9,9,9,9,9,9,9,9,9,1,0,9 ; 126, FAILED
    ; cardNum DB 16 dup (?)
    cardSum     DB 0
    ten         DB 10 
    two         DB 2
    remainder   DB 0
    quotient    DB 0

    msg1 DB "Card Number: 4263982640269299$"
    msg2 DB 13,10,"It is valid.$"
    msg3 DB 13,10,"It is invalid.$"
.CODE

MAIN PROC
    PRNSTR MACRO STR
        MOV AH,09H
        LEA DX,STR
        INT 21H
    ENDM

    GET_ARR MACRO ARR, NUM
        LOCAL GET_ARR_LOOP
        MOV CX,NUM
        MOV SI,0
        GET_ARR_LOOP:
            MOV AH,01H
            INT 21H
            MOV ARR[SI],AL
            INC SI
            LOOP GET_ARR_LOOP
    ENDM

    MOV AX,@DATA
    MOV DS,AX
    MOV AX,0

    GET_ARR cardNum, 16

    MOV CX,16
    MOV SI,0
    TO_DEC:
        MOV AL,cardNum[SI]
        SUB AL,30H
        MOV cardNum[SI],AL
        INC SI
        LOOP TO_DEC

    ;-----VALID:   4263982640269299
    ;-----INVALID: 4388576018402626

    ;-----Step 1:  
    ;     Double every second digit from right to left. 
    ;     If doubling of a digit results in a two-digit number,
    ;     add up the two digits to get a single-digit number.
    ;     Add all single-digit numbers.
    ;     ### 9+9+4+8+4+9+3+8=54
    MOV SI,0
    STEP1:
        MOV BL,cardNum[SI]
        CMP BL,0
        JE STEP1_0
        CMP BL,1
        JE STEP1_1
        CMP BL,2
        JE STEP1_2
        CMP BL,3
        JE STEP1_3
        CMP BL,4
        JE STEP1_4
        CMP BL,5
        JE STEP1_5
        CMP BL,6
        JE STEP1_6
        CMP BL,7
        JE STEP1_7
        CMP BL,8
        JE STEP1_8
        CMP BL,9
        JE STEP1_9
        STEP1_CONT:
            INC SI
            INC SI
            CMP SI,16
            JE STEP2
            JMP STEP1
    STEP1_9:
        ADD cardSum,9
        JMP STEP1_CONT
    STEP1_8:
        ADD cardSum,7
        JMP STEP1_CONT
    STEP1_7:
        ADD cardSum,5
        JMP STEP1_CONT
    STEP1_6:
        ADD cardSum,3
        JMP STEP1_CONT
    STEP1_5:
        ADD cardSum,1
        JMP STEP1_CONT
    STEP1_4:
        ADD cardSum,8
        JMP STEP1_CONT
    STEP1_3:
        ADD cardSum,6
        JMP STEP1_CONT
    STEP1_2:
        ADD cardSum,4
        JMP STEP1_CONT
    STEP1_1:
        ADD cardSum,2
        JMP STEP1_CONT
    STEP1_0:
        ADD cardSum,0
        JMP STEP1_CONT

    ;-----Step 2:
    ;     Add all digits in the odd places from right to left in the card
    ;     ### 9+2+6+0+6+8+3+2=36
    ;     Sum the results from Step 1.
    ;     ### 54 + 36 = 90
    STEP2:
        MOV CX,8
        MOV SI,1
        STEP2_LOOP:
            MOV BL,cardNum[SI]
            ADD cardSum,BL
            INC SI
            INC SI
            LOOP STEP2_LOOP

    ;-----Step 4:
    ;     If the result from Step 4 is divisible by 10, 
    ;     the card number is valid; 
    ;     otherwise, it is invalid. 
    ;     ### 90 % 10 = 0
    ;     ### 90 / 10 = R(0), Q(9)

    MOV AX,0
    MOV AL,cardSum
    DIV ten

    MOV quotient,AL
    MOV remainder,AH

    ADD quotient,30H
    ADD remainder,30H

    MOV AH,02H
    MOV DL,quotient
    INT 21H
    MOV AH,02H
    MOV DL,remainder
    INT 21H

    CMP remainder,30H
    JE VALID_MSG
    JNE INVALID_MSG

    VALID_MSG:
        PRNSTR msg2
        JMP EXIT

    INVALID_MSG:
        PRNSTR msg3
    
    EXIT:
    ;--------------TERMINATE
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
