.MODEL SMALL
.STACK 100
.DATA
    list DW 65535,65534,65533,7272
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BX,list
    MOV AH,02H
    MOV DX,BX
    SUB DX,65500
    INT 21H

    MOV BX,list+3
    MOV AH,02H
    MOV DX,BX
    SUB DX,65500
    INT 21H

    MOV BX,list+5
    MOV AH,02H
    MOV DX,BX
    SUB DX,65500
    INT 21H

    MOV BX,list+10
    MOV AH,02H
    MOV DX,BX
    SUB DX,65500
    INT 21H

    ;--------------TERMINATE
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
