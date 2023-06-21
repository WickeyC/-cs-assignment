.MODEL SMALL
.STACK 100 
.386
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
;---PrintString
PRNSTR MACRO STR
        MOV AH,09H
        LEA DX,STR
        INT 21H
ENDM
PRNSTR_COLOR MACRO STR, LEN, COLOR
        MOV AH,9
        MOV BH,0
        MOV BL,COLOR; <--- color
        MOV CX,LEN; <--- number of chars
        INT 10H
        LEA DX,STR
        INT 21H
ENDM
PRN_WHSP MACRO LEN
        LOCAL PRN_WHSP_LOOP
        OUTPUT_BYTE 13
        OUTPUT_BYTE 10
        MOV CX,LEN
        PRN_WHSP_LOOP:
            OUTPUT_BYTE " "
            LOOP PRN_WHSP_LOOP
ENDM
OUTPUT_BYTE MACRO B
        MOV AH,02H
        MOV DL,B
        INT 21H
ENDM

.DATA 

            ;---Random Ref Code
            RanRefCode1 DW ?
            RanRefCode2 DW ?

            ;---OUTPUT Message
            RefMsg DB 'Your Referral Code Number is $'
            RefCode DB 10 DUP ("$")

            NL_1 DB 13,10
                 DB "$"
            NL_2 DB 13,10,13,10
                 DB "$"
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

            ;---GENERATE REF CODE---
                ;---Get System Time || AH = 2CH
                MOV AH, 2CH
                INT 21H

                MOV RanRefCode1,CX; CX > CH = hour CL = minute
                MOV RanRefCode2,DX; DX > DH = second; DL = centisecond (1/100 seconds)
                ; Note: on most systems, the resolution of the system clock 
                ; is about 5/100sec, so returned times generally 
                ; do not increment by 1 on some systems, 
                ; DL may always return 00h
                
                ;--------OUTPUT REF CODE (8 or 9 digits)---------
                PRN_WHSP 10
                PRNSTR RefMsg
                ; PRNSTR_COLOR RefMsg,29,1
                PRNSTR NL_2
                PRN_WHSP 20
                ;By outputing using Hex to Dec algorithm, 
                ;we get random-alike number that will change every centisecond

                ;COLORED REFCODE
                    MOV AH,9
                    MOV BH,0
                    MOV BL,3; <--- color
                    MOV CX,9; <--- number of chars
                    INT 10H
                FOURDIGITS RanRefCode1 ;Output whole CX
                FIVEDIGITS RanRefCode2 ;Output whole DX
                 ;---Output Ref Code to File---
                    ; Read Ref Code Cursor Position to get String
                    ; store in --> RefCode DB 10 DUP ("$")
                        ; Get Cursor Position || INT 10H - AH = 03H 
                        ; DH = Row, DL = Column
                        ; AX = 0, CH = Start scan line, CL = End scan line, DH = Row, DL = Column
                        MOV AH,03H 
                        INT 10H
                        ; Set Minus nine cursor position || INT 10H - AH = 02H 
                        ; DH = Row, DL = Column
                        MOV AL,DL
                        SUB AL,9
                        MOV DL,AL
                        MOV AH,02H
                        INT 10H
                        ; Read Cursor Position || INT 10H - AH = 08H 
                        ; AH = Color, AL = Character 
                        MOV SI,0
                        MOV CX,9
                        READ_CODE:
                            MOV AH,08H
                            INT 10H
                            MOV RefCode[SI],AL
                            INC SI
                            INC DL
                            MOV AH,02H
                            INT 10H
                            LOOP READ_CODE
                        PRNSTR RefCode

        MOV AH,4CH
        INT 21H
MAIN ENDP
    END MAIN