.MODEL SMALL
.STACK 100
.386
.DATA
    LOGO DB 13,10,"    ___   /\             /\   ___    __________   ____   __      __ "
         DB 13,10,"   /  /  /  \           /  \  \  \   \______   \ /  _ \ /  \    /  \"
         DB 13,10,"  /  /   \/\/   ______  \/\/   \  \   |    |  _/ >  _ </\   \/\/   /"
         DB 13,10," (  (          /_____/          )  )  |    |   \/  <_\ \/\        / "
         DB 13,10,"  \  \                         /  /   |______  /\_____\ \ \__/\  /  "
         DB 13,10,"   \__\                       /__/           \/        \/      \/   $"
    INIT_MENU_MSG DB 13,10,"Welcome to B&W self-ordering kiosk!$"
    INIT_MENU DB 13,10,"1. Sign Up (New Customer)"
              DB 13,10,"2. Login (Existing Customer)"
              DB 13,10,"3. Quit$" 
    ENTER_CHOICE_MSG DB 13,10,"Enter your choice (1-3): $"
    choiceErrorMsg DB 13,10,"Invalid number! Please enter again!$"
    CHOICE DB 0
    TQ_MSG DB 13,10,60 dup (03)
           DB 13,10,"Thank you for using the kiosk! Press any key to use it again...$"
    contMsg DB 13,10,"Press any key to continue...$"

    createAccMsg DB       "|======================|"
                 DB 13,10,"| Create a New Account |"
                 DB 13,10,"|======================|$"
    enterUsernameMsg DB 13,10,"Enter your username: $"
    enterPswMsg DB 13,10,"Enter your password: $"
    enterConfirmPswMsg DB 13,10,"Confirm your password: $"
    notSignedUpMsg DB 60 dup (18)
                   DB 13,10,"| You haven't signed up! Please sign up before logging in. |"
                   DB 13,10, 60 dup (18), "$"
    loginAccMsg DB       "|========================|"
                DB 13,10,"| Log in to your Account |"
                DB 13,10,"|========================|$"
    mainMenuMsg  DB       "|========================|"
                 DB 13,10,"  ### Welcome, $" 
    mainMenuMsg2 DB 13,10,"|========================|"
                 DB 13,10,13,10,"1. Place order"
                 DB 13,10,      "2. Make payment"
                 DB 13,10,      "3. Logout"
                 DB 13,10,"$"

    registeredPsw db 8 dup (0)
    confirmPsw db 8 dup (0)
    loginUsername db 8 dup (0)
    loginPsw db 8 dup (0)
    isSignedUp db 0

    sUsername DB 9
              DB ?
              DB 9 DUP (0)
    lUsername DB 9
              DB ?
              DB 9 DUP (0)

    signupSuccessMsg DB 13,10,"You've signed up! Your latest username is $"
    signupSuccessMsg2 DB ". Please use it to login.$"
    correctPswMsg DB 13,10,"Welcome. You've logged in successfully!$"
    wrongLoginMsg DB 13,10,"Incorrect username/password!"
                DB 13,10,"Enter 1 to retry or 2 to go back to initial menu: $"
    
.CODE
MAIN PROC
    ; <<<<<<<<<<<< Macros >>>>>>>>>>>>
    PRNSTR MACRO STR
        MOV AH,09H
        LEA DX,STR
        INT 21H
    ENDM
    ;------
    PRNSTR_OFFSET MACRO STR
        MOV ah,09H
        mov dx, offset STR + 2 ;MUST END WITH '$'.
        int 21h
    ENDM
    ;------
    PRINT_ARR MACRO ARR, NUM
        LOCAL PRINT_ARR_LOOP
        MOV CX,NUM
        MOV SI,0
        PRINT_ARR_LOOP:
            MOV AH,02H
            MOV DL,ARR[SI]
            INT 21H
            INC SI
            LOOP PRINT_ARR_LOOP
    ENDM
    ;------
    GET_ARR MACRO ARR, NUM
        LOCAL GET_ARR_LOOP
        MOV CX,8
        MOV SI,0
        GET_ARR_LOOP:
            MOV AH,01H
            INT 21H
            MOV ARR[SI],AL
            INC SI
            LOOP GET_ARR_LOOP
    ENDM
    ; <<<<<<<<<<<< End of Macros >>>>>>>>>>>>


    MOV AX,@DATA
    MOV DS,AX

    START:
        CALL CLS
        PRNSTR LOGO
        PRNSTR INIT_MENU
        ;-----USER INPUT
            PRNSTR ENTER_CHOICE_MSG
            ;-----INPUT BYTE
            MOV AH,01H
            INT 21H
            ;-----MOVE USER INPUT FROM AL TO CHOICE
            MOV CHOICE,AL
        
        ;-----Compare
        CMP CHOICE,31H
        JE SignUp
        CMP CHOICE,32H
        JE Login
        CMP CHOICE,33H
        JE QUIT
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        CALL CLS
        JMP START

    SignUp:
        CALL CLS
        PRNSTR createAccMsg
        ; Get register username
        PRNSTR enterUsernameMsg
        ;---INPUT STRING:0AH
        MOV AH,0AH
        MOV DX, OFFSET sUsername
        INT 21H
        ;CHANGE CHR(13) BY '$'.
            mov si, offset sUsername + 1 ;NUMBER OF CHARACTERS ENTERED.
            mov cl, [ si ] ;MOVE LENGTH TO CL.
            mov ch, 0      ;CLEAR CH TO USE CX. 
            inc cx ;TO REACH CHR(13).
            add si, cx ;NOW SI POINTS TO CHR(13).
            mov al, '$'
            mov [ si ], al ;REPLACE CHR(13) BY '$'.
        ; Get register password
        PRNSTR enterPswMsg
        GET_ARR registeredPsw, 8
        MOV isSignedUp,01H
        PRNSTR signupSuccessMsg
        PRNSTR_OFFSET sUsername
        PRNSTR signupSuccessMsg2
        CALL PRESS_CONT
        CALL CLS
        JMP START

    Login:
        CALL CLS
        CMP isSignedUp,1
        JNE NotSignedUp
        PRNSTR loginAccMsg
        ; Get login username
        PRNSTR enterUsernameMsg
        ;---INPUT STRING:0AH
        MOV AH,0AH
        MOV DX, OFFSET lUsername
        INT 21H
        ;CHANGE CHR(13) BY '$'.
            mov si, offset lUsername + 1 ;NUMBER OF CHARACTERS ENTERED.
            mov cl, [ si ] ;MOVE LENGTH TO CL.
            mov ch, 0      ;CLEAR CH TO USE CX. 
            inc cx ;TO REACH CHR(13).
            add si, cx ;NOW SI POINTS TO CHR(13).
            mov al, '$'
            mov [ si ], al ;REPLACE CHR(13) BY '$'.
        ; Get login password
        PRNSTR enterPswMsg
        GET_ARR loginPsw, 8

        ; Verify username (STRING COMPARISION)
        MOV BX,00
        MOV BL,sUsername+1
        MOV BH,lUsername+1
        CMP BL,BH
        JNE WRONG_LOGIN

        LEA SI,sUsername
        LEA DI,lUsername
        ADD SI,2
        ADD DI,2
        CHECK_USERNAME:
            MOV BL,BYTE PTR[SI]
            CMP BYTE PTR[DI],BL
            JNE WRONG_LOGIN
            INC SI
            INC DI
            CMP BYTE PTR[DI],"$"
            JNE CHECK_USERNAME

        ; Verify password
        MOV CX,8
        MOV SI,0
        VerifyLoginPsw:
            MOV AL,loginPsw[SI]
            CMP AL,registeredPsw[SI]
            JNE WRONG_LOGIN
            INC SI
            LOOP VerifyLoginPsw        
        CORRECT_PSW:
            PRNSTR correctPswMsg
            CALL PRESS_CONT
            CALL CLS
            JMP MAIN_MENU
        WRONG_LOGIN:
            PRNSTR wrongLoginMsg
            MOV AH,01H
            INT 21H
            MOV CHOICE,AL
            CMP CHOICE,31H
            JE Login
            CMP CHOICE,32H
            JE Start
            PRNSTR choiceErrorMsg
            CALL PRESS_CONT
            JMP WRONG_LOGIN
    
    NotSignedUp:
        PRNSTR notSignedUpMsg
        CALL PRESS_CONT
        CALL CLS
        JMP START

    MAIN_MENU:
        CALL CLS
        PRNSTR mainMenuMsg
        PRNSTR_OFFSET sUsername
        PRNSTR mainMenuMsg2
        PRNSTR ENTER_CHOICE_MSG
        ; Get choice
        MOV AH,01H
        INT 21H
        MOV CHOICE,AL
        ;-----Compare
        CMP CHOICE,31H
        JE PLACE_ORDER_MENU
        CMP CHOICE,32H
        JE PAYMENT_MENU
        CMP CHOICE,33H
        JE START
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        CALL CLS
        JMP MAIN_MENU

    PLACE_ORDER_MENU:
        JMP START

    PAYMENT_MENU:
        JMP START


    QUIT:
        CALL CLS
        MOV AH,09H
        LEA DX,TQ_MSG
        INT 21H
        MOV AH,0
        INT 16H
        RET

    
    
    ;-----TERMINATE
    MOV AH,4CH
    INT 21H
MAIN ENDP
CLS PROC
    MOV AH,00H
    MOV AL,02H
    INT 10H
    RET
CLS ENDP
PRESS_CONT PROC
    PRNSTR contMsg
    MOV AH,0
    INT 16H
    RET
PRESS_CONT ENDP
    END MAIN