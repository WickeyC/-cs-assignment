.MODEL SMALL
;TODO : macro : mul,tax,discount
;TODO : DEBUG bckspace
;TODO : VALIDATION
.STACK 100
.386
.DATA
;UI
    M1  DB "X: $"
    M2  DB 13,10,"Y: $"
    M3  DB 13,10,"ADD RESULT: $"
    M4  DB 13,10,"SUB RESULT: $"
    M5  DB 13,10,"MUL RESULT: $"
    M6  DB 13,10,"DIV RESULT: $"
    M7  DB 13,10
        DB 13,10,"---FLOATING POINT ADD AND SUB---"
        DB 13,10,"A1: $"
    M8  DB 13,10,"A2: $"
    M9  DB 13,10
        DB 13,10,"---PRICE TAX & DISCOUNT---"
        DB 13,10,"PRICE: $"
    M10 DB 13,10,"PERCENTAGE: $"
    M11 DB "% DISCOUNT RESULT: $"
    M12 DB "% TAX RESULT: $"
    M13 DB "ROUND-OFF RESULT: $"
    NL  DB 13,10,"$"
;INTVAR
    X DW ?
    Y DW ?
    Z DW ?

;FLTVAR
    DOT DB "." ;2E
    ;TODO : CHANGE TO WORD ARRAY (cannot put [0] [1], these are pointing bytes)
    A1Integer DW ?
    A1Mantissa DW ?
    A2Integer DW ?
    A2Mantissa DW ?
    FloatCarry DW ? ;For Addition
    FloatBorrow DW ?

    PRICE_INT DW ?
    PRICE_MAN DW ?
    PERCENTAGE DW ?
    CHANGE_VAL DW ?, ?
    CHANGE_VAL_INT DW ?
    CHANGE_VAL_MAN DW ?
    FloatOverflow DW ? ;For Multiply

    ANSInteger DW ?
    ANSMantissa DW ?

    dotpressed DB 0
.CODE
MAIN PROC
;---MACROS---
;---Functionality Macros---
    ;---PrintStr
        PrintStr MACRO String
        MOV AH, 09H
        LEA DX, String
        INT 21H
        ENDM
    ;---OutputByte
        OutputByte MACRO By
            MOV AH, 02H
            MOV DL, By
            INT 21H
        ENDM
;---Get Input---

    ;--TODO: Change to GET_INT_INPUT
    ;(GET_INT_INPUT : 
    ; 12332.46
    ; 12334.4
    ; 12334 + enter
    ;       cannot receive floating point num, '.'
    ;       0 =< input <= 65535, type check (num only) 
    GET_INT_INPUT MACRO INP
        LOCAL InputNo,FormNo,ViewNo,DelNo,DelNull
        MOV CX,0
        InputNo:
            MOV AH,00H
            INT 16H
            MOV DX,0
            MOV BX,1
            CMP AL,08H ; Backspace
            JE DelNo
            CMP AL,0DH ; Enter Key
            JE FormNo
            MOV dotpressed,1
            CMP AL,2EH ; '.'
            JE FormNo
            MOV dotpressed,0
            ; Validation
            ; Type Check:
            CMP AL,'0'
            JB InputNo
            CMP AL,'9'
            JA InputNo
            ; Range Check:
            CMP CX,5 ; Fix 5 digits
            JAE InputNo
            CALL ViewNo
            MOV AH,00H
            SUB AL,30H
            PUSH AX ;stack: AX 1 2 3 4 5
            INC CX ; 1
            JMP InputNo
        DelNo:
            CMP CX,0
            JE DelNull
            POP AX ; Ax = 1
            DEC CX ; 0
            ; MOV deltemp,CX
            PUSH CX ; stack CX 0
            ;XOR AX,AX
            ;Get Cursor Position 
            MOV AH,03H ;DH = Row, DL = Column
            INT 10H
            ;Set Minus one cursor position
            MOV AL,DL
            SUB AL,1
            MOV DL,AL
            MOV AH,02H
            INT 10H
            PUSH DX
            ;Print Space
            MOV AH,02H
            MOV DL,20H
            INT 21H
            ;Set Back Cursor Position
            POP DX
            MOV AH,02H
            INT 10H
            ;TODO: Write Nul No (space? 32D , 20H)
            POP CX ; 0
            ; MOV CX,deltemp
            DelNull:
            JMP InputNo

        ViewNo:
            ;PUSH AX 
            PUSH DX 
            MOV DX,AX 
            ;ADD DL,30H 
            MOV AH,02H
            INT 21H
            POP DX 
            ;POP AX 
            RET
        FormNo: 
            POP AX ; stack: AX 1 2 3 4 5
            PUSH DX 
            MUL BX ; 1,10,100,1000
            POP DX 
            ADD DX,AX ; 5, 5+40, 45+300
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
    GET_MAN_INPUT MACRO INP
        LOCAL InputNo,FormNo,ViewNo,Formtenths,Formhundreths,Mantissa_Error,DelNo,DelNull,END
        MOV CX,0
        InputNo:
            MOV AH,00H
            INT 16H
            MOV DX,0
            MOV BX,1
            CMP AL,08H ; Backspace
            JE DelNo
            CMP AL,0DH ; Enter Key
            JE FormNo
            ;---Validation
            ; Type Check:
            CMP AL,'0'
            JB InputNo
            CMP AL,'9'
            JA InputNo
            ; Range Check:
            CMP CX,2 ; Fix 2 decimal places
            JAE InputNo
            CALL ViewNo
            MOV AH,00H
            SUB AL,30H
            PUSH AX
            INC CX
            JMP InputNo
        DelNo:
            CMP CX,0
            JE DelNull
            POP AX ; Ax = 1
            DEC CX ; 0
            ; MOV deltemp,CX
            PUSH CX ; stack CX 0
            ;XOR AX,AX
            ;Get Cursor Position 
            MOV AH,03H ;DH = Row, DL = Column
            INT 10H
            ;Set Minus one cursor position
            MOV AL,DL
            SUB AL,1
            MOV DL,AL
            MOV AH,02H
            INT 10H
            PUSH DX
            ;Print Space
            MOV AH,02H
            MOV DL,20H
            INT 21H
            ;Set Back Cursor Position
            POP DX
            MOV AH,02H
            INT 10H
            ;TODO: Write Nul No (space? 32D , 20H)
            POP CX ; 0
            ; MOV CX,deltemp
            DelNull:
            JMP InputNo
        ViewNo:
            ;PUSH AX 
            PUSH DX 
            MOV DX,AX 
            ;ADD DL,30H 
            MOV AH,02H
            INT 21H
            POP DX 
            ;POP AX 
            RET
        FormNo: 
        ;CX = 1 , AX*10
        CMP CX,1
        JNE Formhundreths
        Formtenths:
            POP AX
            MOV BX,10
            MUL BX
            MOV INP,AX
            DEC CX
            JMP END
        Formhundreths:
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
            JNE Formhundreths
            MOV INP,DX
        END:
    ENDM

    GET_FLOAT_INPUT MACRO Integer,Mantissa
        LOCAL DOT_PRESSED,END
        GET_INT_INPUT Integer
        XOR AX,AX
        MOV AL,dotpressed
        CMP AL,1
        JE DOT_PRESSED
            MOV Mantissa,0
            JMP END
        DOT_PRESSED:
        OutputByte DOT
        GET_MAN_INPUT Mantissa
        END:
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
        XOR AX,AX
        MOV AX,X
        MUL Y
        MOV RES,AX
    ENDM
    DIVISION MACRO X,Y,RES
        XOR AX,AX
        XOR DX,DX
        MOV AX,X
        DIV Y
        MOV RES,AX
    ENDM
    DIV100 MACRO X,RES,REM
        XOR DX,DX
        MOV AX,X
        MOV CX,100
        DIV CX
        MOV RES,AX
        MOV REM,DX
    ENDM


    ADDITION_FLT MACRO FINT,FMAN,SINT,SMAN,RESINT,RESMAN
        LOCAL ADDINTEGER,END

        ADDITION FMAN,SMAN,RESMAN
        DIV100 RESMAN,FloatCarry,RESMAN

        ADDINTEGER:
            ADDITION FINT,SINT,RESINT
            CMP FloatCarry,0
            JE END
            ADDITION RESINT,1,RESINT
        END:
    ENDM
    SUBTRACTION_FLT MACRO FINT,FMAN,SINT,SMAN,RESINT,RESMAN
        LOCAL SUB_without_BORROW,SUB_with_BORROW,END

        MOV AX,SMAN
        CMP FMAN,AX
        JAE SUB_without_BORROW
        ;---Borrow from Integer---
        SUB_with_BORROW:
            MOV BX,FMAN
            ADDITION FMAN,100,BX
            PUSH BX
            MOV BX,FINT
            SUBTRACTION FINT,1,BX
            ; MOV FloatBorrow,1
        SUBTRACTION BX,SINT,RESINT
        POP BX
        SUBTRACTION BX,SMAN,RESMAN
        JMP END

        SUB_without_BORROW:
            SUBTRACTION FINT,SINT,RESINT
            SUBTRACTION FMAN,SMAN,RESMAN

        ; MOV AX,FloatBorrow
        ; CMP AX,1
        ; JNE END
        ; SUBTRACTION FMAN,100,FMAN
        ; ADDITION FINT,1,FINT

        END:
    ENDM
    MULTIPLICATION_FLT MACRO multiplicandINT,multiplicandMAN,multiplier,resultINT,resultMAN
        LOCAL END
        MULTIPLICATION multiplicandINT,multiplier,resultINT
        MULTIPLICATION multiplicandMAN,multiplier,resultMAN
        ;HANDLE OVERFLOW
        DIV100 resultMAN,FloatOverflow,resultMAN
        CMP FloatOverflow,0
        JE END
        ADDITION resultINT, FloatOverflow, resultINT
        END:
    ENDM
    CALC_PERCENTAGE_VALUE MACRO changevalueINT,changevalueMAN
        LOCAL RETURN_CHANGE_VALUE
        MOV AX,changevalueMAN
        CMP AX,50
        JB RETURN_CHANGE_VALUE
        ADDITION changevalueINT,1,changevalueINT

        RETURN_CHANGE_VALUE:
        DIV100 changevalueINT,changevalueINT,changevalueMAN
    ENDM
    AFTER_TAX MACRO PERCENTAGE,priceINT,priceMAN
        MULTIPLICATION_FLT priceINT,priceMAN,PERCENTAGE,CHANGE_VAL_INT,CHANGE_VAL_MAN
        CALC_PERCENTAGE_VALUE CHANGE_VAL_INT,CHANGE_VAL_MAN
        ADDITION_FLT priceINT,priceMAN,CHANGE_VAL_INT,CHANGE_VAL_MAN,priceINT,priceMAN
    ENDM
    AFTER_DISCOUNT MACRO PERCENTAGE,priceINT,priceMAN
        MULTIPLICATION_FLT priceINT,priceMAN,PERCENTAGE,CHANGE_VAL_INT,CHANGE_VAL_MAN
        CALC_PERCENTAGE_VALUE CHANGE_VAL_INT,CHANGE_VAL_MAN
        SUBTRACTION_FLT priceINT,priceMAN,CHANGE_VAL_INT,CHANGE_VAL_MAN,priceINT,priceMAN
    ENDM
    RoundOff MACRO Integer,Mantissa
        LOCAL END,CHKCarry
        XOR DX,DX
        MOV AX,Mantissa ;99
        MOV CX,10
        DIV CX
        CMP DX,5 ; AX = Q9, DX = R9
        JB CHKCarry
        ADD AX,1 ; AX = 10
        CHKCarry:
        MOV CX,10
        MUL CX   ; AX = 100
        XOR DX,DX
        MOV CX,100
        DIV CX ; AX = Q00, DX = R1
        ;DX = Floatcarry
        MOV Mantissa,DX
        CMP AX,0
        JE END
        ADDITION Integer,1,Integer
        END:
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
            MOV DX,NUM
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
    ;--TODO: Output Floating Point
    OutputFloat MACRO Integer,Mantissa
        OutputCalcResult Integer
        OutputByte DOT
        TWODIGITS Mantissa
    ENDM
;---ENDMACROS---

;--------------------------------MAIN--------------------------------
    MOV AX,@DATA
    MOV DS,AX

; ;INTEGER MATHS
;     ;PROMPT INPUT
;         PrintStr M1
;         GET_INT_INPUT X ;DX = 123
;         PrintStr M2
;         GET_INT_INPUT Y
        
;     ;ADDITION
;         ADDITION X,Y,Z
;         PrintStr M3
;         OutputCalcResult Z

;     ;SUBTRACTION
;         SUBTRACTION X,Y,Z
;         PrintStr M4
;         OutputCalcResult Z

;     ;MULTIPLICATION
;         MULTIPLICATION X,Y,Z
;         PrintStr M5
;         OutputCalcResult Z

;     ;DIVISION
;         DIVISION X,Y,X
;         PrintStr M6
;         OutputCalcResult X

;FLOATING POINT ADD SUB 
    ;PROMPT INPUT
        PrintStr M7
        GET_FLOAT_INPUT A1Integer,A1Mantissa
        PrintStr M8
        GET_FLOAT_INPUT A2Integer,A2Mantissa
    ;ADDITION
        ADDITION_FLT A1Integer,A1Mantissa,A2Integer,A2Mantissa,ANSInteger,ANSMantissa
            PrintStr M3
            OutputCalcResult ANSInteger
            OutputByte DOT
            TWODIGITS ANSMantissa

    ;SUBTRACTION
        SUBTRACTION_FLT A1Integer,A1Mantissa,A2Integer,A2Mantissa,ANSInteger,ANSMantissa
            PrintStr M4
            OutputCalcResult ANSInteger
            OutputByte DOT
            TWODIGITS ANSMantissa
;FLOATING POINT MUL 
;Tax / Discount 
    ;PROMPT INPUT
        PrintStr M9
        GET_FLOAT_INPUT PRICE_INT,PRICE_MAN
        ; PrintStr M10
        ; GET_INT_INPUT PERCENTAGE
    ;MULTIPLICATION
    ; MULTIPLICATION_FLT PRICE_INT,PRICE_MAN,PERCENTAGE,CHANGE_VAL_INT,CHANGE_VAL_MAN

    ;         PrintStr NL
    ;         PrintStr M5
    ;         OutputFloat CHANGE_VAL_INT,CHANGE_VAL_MAN

    ; CALC_PERCENTAGE_VALUE CHANGE_VAL_INT,CHANGE_VAL_MAN

    printStr NL

    ;AFTER_DISCOUNT MACRO PERCENTAGE,PRICE
    ;*% DISCOUNT 5%
        MOV PERCENTAGE,5
        AFTER_DISCOUNT PERCENTAGE,PRICE_INT,PRICE_MAN
        printStr NL
        OutputCalcResult PERCENTAGE
        printStr M11
        OutputFloat PRICE_INT,PRICE_MAN
    ;*% TAX 6%
        MOV PERCENTAGE,6
        AFTER_TAX PERCENTAGE,PRICE_INT,PRICE_MAN
        printStr NL
        OutputCalcResult PERCENTAGE
        printStr M12
        OutputFloat PRICE_INT,PRICE_MAN
    ;ROUND OFF
        printStr NL
        printStr M13
        RoundOff PRICE_INT,PRICE_MAN
        OutputFloat PRICE_INT,PRICE_MAN
;TERMINATE
    MOV AH,4CH
    INT 21H
;--------------------------------ENDMAIN--------------------------------
MAIN ENDP
    END MAIN
