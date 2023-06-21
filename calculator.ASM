.MODEL SMALL
.STACK 100
.386
.DATA
    M1 DB "X: $"
    M2 DB 13,10,"Y: $"
    M3 DB 13,10,"ADD RESULT: $"
    M4 DB 13,10,"SUB RESULT: $"
    M5 DB 13,10,"MUL RESULT: $"
    M6 DB 13,10,"DIV RESULT: $"
    X DW ?
    Y DW ?
    Z DW ?
.CODE
MAIN PROC
;---Functionality Macros---
    PrintStr MACRO String
        MOV AH, 09H
        LEA DX, String
        INT 21H
    ENDM

;---Get Input---
    GET_NUM_INPUT MACRO INP
        LOCAL InputNo,FormNo,ViewNo
        MOV CX,0
        InputNo:
            MOV AH,00H
            INT 16H
            MOV DX,0
            MOV BX,1
            CMP AL,0DH
            JE FormNo
            SUB AX,30H
            call ViewNo
            MOV AH,0
            PUSH AX
            INC CX
            JMP InputNo
        ViewNo:
            PUSH AX 
            PUSH DX 
            MOV DX,AX 
            ADD DL,30H 
            MOV AH,02H
            INT 21H
            POP DX 
            POP AX 
            RET
        FormNo: 
            POP AX 
            PUSH DX 
            MUL BX 
            POP DX 
            ADD DX,AX 
            MOV AX,BX 
            MOV BX,10 
            PUSH DX 
            MUL BX 
            POP DX 
            MOV BX,AX 
            DEC CX
            CMP CX,0
            JNE FormNo
            MOV INP,DX
    ENDM
    
;---Mathematics Operations---
    ADDITION MACRO X,Y,RES
        XOR AX,AX
        MOV AX,X
        ADD AX,Y
        MOV RES,AX
    ENDM
    SUBTRACTION MACRO X,Y,RES
        XOR AX,AX
        MOV AX,X
        SUB AX,Y
        MOV RES,AX
    ENDM
    MULTIPLICATION MACRO X,Y,RES
        MOV AX,X
        MUL Y
        MOV RES,AX
    ENDM
    DIVISION MACRO X,Y,RES
        MOV AX,X
        XOR DX,DX
        DIV Y
        MOV RES,AX
    ENDM

;---Display Result---
    OutputCalcResult MACRO NUM
        LOCAL CHK5,CHK4,CHK3,CHK2,PRT1,END
        CHK5:
        CMP NUM,9999
        JBE CHK4 
        FIVEDIGITS NUM
        JMP END

        CHK4:
        CMP NUM,999
        JBE CHK3
        FOURDIGITS NUM
        JMP END

        CHK3:
        CMP NUM,99
        JBE CHK2
        THREEDIGITS NUM
        JMP END

        CHK2:
        CMP NUM,9
        JBE PRT1
        TWODIGITS NUM
        JMP END

        PRT1:
        ONEDIGIT NUM

        END:
    ENDM   
    ViewNo MACRO
            PUSH AX 
            PUSH DX 
            MOV DX,AX 
            ADD DL,30H 
            MOV AH,02H
            INT 21H
            POP DX 
            POP AX
    ENDM
    ONEDIGIT MACRO NUM
            ADD DX,30H
            MOV DX,DX
            MOV AH,02H
            INT 21H
    ENDM
    TWODIGITS MACRO NUM
        LOCAL PRINT2
        MOV DX,NUM
        XOR CX,CX
        MOV CX,10
        PRINT2:
        MOV AX,DX    
        MOV DX,0    
        DIV CX 
        ViewNo  
        MOV BX,DX   
        MOV DX,0   
        MOV AX,CX
        MOV CX,10
        DIV CX
        MOV DX,BX
        MOV CX,AX
        CMP AX,0
        JNE PRINT2
    ENDM    
    THREEDIGITS MACRO NUM
        LOCAL PRINT3
        MOV DX,NUM
        XOR CX,CX
        MOV CX,100
        PRINT3:
        MOV AX,DX    
        MOV DX,0    
        DIV CX 
        ViewNo  
        MOV BX,DX   
        MOV DX,0   
        MOV AX,CX
        MOV CX,10
        DIV CX
        MOV DX,BX
        MOV CX,AX
        CMP AX,0
        JNE PRINT3
    ENDM
    FOURDIGITS MACRO NUM
        LOCAL PRINT4
        MOV DX,NUM
        XOR CX,CX
        MOV CX,1000
        PRINT4:
        MOV AX,DX    
        MOV DX,0    
        DIV CX 
        ViewNo  
        MOV BX,DX   
        MOV DX,0   
        MOV AX,CX
        MOV CX,10
        DIV CX
        MOV DX,BX
        MOV CX,AX
        CMP AX,0
        JNE PRINT4
    ENDM
    FIVEDIGITS MACRO NUM
        LOCAL PRINT5
        MOV DX,NUM 
        XOR CX,CX
        MOV CX,10000
        PRINT5:  
        MOV AX,DX    
        MOV DX,0  
        DIV CX 
        ViewNo  
        MOV BX,DX    
        MOV DX,0    
        MOV AX,CX   
        MOV CX,10 
        DIV CX
        MOV DX,BX 
        MOV CX,AX
        CMP AX,0 
        JNE PRINT5
    ENDM

;---ENDMACROS---

;MAIN
    MOV AX,@DATA
    MOV DS,AX

    ;PROMPT INPUT
        PrintStr M1
        GET_NUM_INPUT X
        PrintStr M2
        GET_NUM_INPUT Y
        
    ;ADDITION
        ADDITION X,Y,Z
        PrintStr M3
        OutputCalcResult Z

    ;SUBTRACTION
        SUBTRACTION X,Y,Z
        PrintStr M4
        OutputCalcResult Z

    ;MULTIPLICATION
        MULTIPLICATION X,Y,Z
        PrintStr M5
        OutputCalcResult Z

    ;DIVISION
        DIVISION X,Y,Z
        PrintStr M6
        OutputCalcResult Z

        MOV AH,4CH
        INT 21H
;ENDMAIN
MAIN ENDP
    END MAIN
