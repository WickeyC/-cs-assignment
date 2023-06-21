.MODEL SMALL
.STACK 100 
.386

;---PrintString
printStr MACRO String
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

;---NEWLINE
Newline MACRO
    MOV AH,02H
    MOV DL,0DH ;CARRIAGE RETURN (Move THE CURSOR to LEFTMOST)
    INT 21H
    MOV DL,0AH ;OUTPUT NEWLINE
    INT 21H
ENDM

;---ConvertBytetoDEC then display----
;---TWO DIGITS
hexTOdec_TWO MACRO hex_byte
    XOR AX,AX
    MOV AL,hex_byte
    MOV BL,10
    DIV BL
    MOV Q,AL
    MOV R,AH
    ADD Q,30H
    ADD R,30H

    ;---OUTPUT BYTE: 02(Q)
    MOV AH,02H
    MOV DL,Q
    INT 21H
    ;---OUTPUT BYTE: 02(R)
    MOV AH,02H
    MOV DL,R
    INT 21H
ENDM

;---FOUR DIGITS (<3E7) 100D >=64H <=FFH 
hexTOdec_FOUR MACRO hex_byte
    XOR AX,AX
    MOV AX,hex_byte
    MOV BL,10
    DIV BL
    MOV Q1,AL
    MOV R1,AH

    XOR AX,AX
    MOV AL,Q1
    DIV BL
    MOV Q2,AL
    MOV R2,AH

    XOR AX,AX
    MOV AL,Q2
    DIV BL
    MOV Q3,AL
    MOV R3,AH

    ADD Q3,30H
    ADD R3,30H
    ADD R2,30H
    ADD R1,30H

    ;---OUTPUT BYTE: 02(Q3)
    MOV AH,02H
    MOV DL,Q3
    INT 21H
    ;---OUTPUT BYTE: 02(R3)
    MOV AH,02H
    MOV DL,R3
    INT 21H
    ;---OUTPUT BYTE: 02(R2)
    MOV AH,02H
    MOV DL,R2
    INT 21H
    ;---OUTPUT BYTE: 02(R1)
    MOV AH,02H
    MOV DL,R1
    INT 21H
ENDM

.DATA 
            ;---Converting Purposed Variables
            TEN DB 10
            Q DB 0
            R DB 0
            Q1 DB 0 ;202/CA
            R1 DB 0 ;d 1
            Q2 DB 0 ;20/14
            R2 DB 0 ;c 2
            Q3 DB 0 ;a 2
            R3 DB 0 ;b 0

            ;---System Date
            YEAR       DW ?
            MONTH       DB ?
            DAY         DB ?
            Day_of_week DB ? ;00H = Sunday
            ;---System Time
            HOUR        DB ?
            MINUTE      DB ?
            SECOND      DB ?
            CENTISECOND DB ? ;1/100 seconds

            ;---OUTPUT Message
            DateMSG1 DB 'Date: $'
            DateMSG2 DB ' Year  $'
            DateMSG3 DB ' Month  $'
            DateMSG4 DB ' Day  $'
            DateMSG5 DB ' DayofW$'
            TimeMSG1 DB 'Time  : $'
            TimeMSG2 DB ' Hour(s)  $'
            TimeMSG3 DB ' Second(S)  $'
            TimeMSG4 DB ' Centisecond(s)$'

.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
            
            ;---Drawing
            MOV AX,0600H
            MOV BH,11H
            MOV CX,0000H
            MOV DX,0101H
            INT 10H

            ;---Get System Date || AH = 2AH
            MOV AH, 2AH
            INT 21H

            MOV YEAR,CX         ; CX = year (1980-2099)2021 0FE9
            MOV MONTH,DH        ; DH = month
            MOV DAY,DL          ; DL = day 
            MOV Day_of_week,AL  ; AL = day of week (00h=Sunday)

            ;---Get System Time || AH = 2CH
            MOV AH, 2CH
            INT 21H

            MOV HOUR,CH; CH = hour
            MOV MINUTE,CL; CL = minute
            MOV SECOND,DH; DH = second
            MOV CENTISECOND,DL; DL = centisecond (1/100 seconds)
            ; Note: on most systems, the resolution of the system clock 
            ; is about 5/100sec, so returned times generally 
            ; do not increment by 1 on some systems, 
            ; DL may always return 00h
            
            ;--------OUTPUT---------
            printStr TimeMSG1
            Newline

            hexTOdec_TWO HOUR
            hexTOdec_TWO MINUTE
            printStr TimeMSG2
            hexTOdec_TWO SECOND
            printStr TimeMSG3
            hexTOdec_TWO CENTISECOND
            printStr TimeMSG4
            ;printStr TimeMSG2

            Newline
            Newline
            printStr DateMSG1
            Newline
            
            hexTOdec_FOUR YEAR  
            printStr DateMSG2     
            hexTOdec_TWO MONTH      
            printStr DateMSG3
            hexTOdec_TWO DAY        
            printStr DateMSG4
            hexTOdec_TWO Day_of_week
            printStr DateMSG5

        MOV AH,4CH
        INT 21H
MAIN ENDP
    END MAIN