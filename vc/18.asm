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
    TQ_MSG DB 13,10,30 dup (03)
           DB 13,10,"Thank you for using the kiosk!"
           DB 13,10,"Enter 1 to use it again or any other keys to terminate: $"
    contMsg DB 13,10,"Press any key to continue...$"

    createAccMsg DB       "|======================|"
                 DB 13,10,"|-Create a New Account-|"
                 DB 13,10,"|======================|$"
    enterUsernameMsg DB 13,10,"Enter your username: $"
    enterPswMsg DB 13,10,"Enter your password: $"
    ; enterConfirmPswMsg DB 13,10,"Confirm your password: $"
    invalidPasswordMsg DB 13,10,"<<< Sorry, invalid password! >>>"
                       DB 13,10,"~~~ Password must meet the following requirements:"
                       DB 13,10,"    - Length of 8 letters"
                       DB 13,10,"    - Contains at least 1 uppercase and 1 lowercase letter"
                       DB 13,10,"    - Contains at least 1 number"
                       DB 13,10,"    - Contains at least 1 special character (!@#?)"
                       DB 13,10,"Enter 1 to retry or 2 to go back to initial menu: $"
    notSignedUpMsg DB 60 dup (18)
                   DB 13,10,"| You haven't signed up! Please sign up before logging in. |"
                   DB 13,10, 60 dup (18), "$"
    loginAccMsg DB       "|========================|"
                DB 13,10,"|-Log in to your Account-|"
                DB 13,10,"|========================|$"
    mainMenuMsg  DB       "|========================|"
                 DB 13,10,"  ### Welcome, $" 
    mainMenuMsg2 DB 13,10,"|========================|"
                 DB 13,10,13,10,"1. Place order"
                 DB 13,10,      "2. Make payment"
                 DB 13,10,      "3. Logout"
                 DB 13,10,"$"
    foodMenuMsg DB       "|========================|"
                DB 13,10,"|-------Food Menu--------|"
                DB 13,10,"|========================|"
                DB 13,10,13,10,"Categories"
                DB 13,10,      "1. Ice Cream"
                DB 13,10,      "2. Cake"
                DB 13,10,      "3. Drinks"
                DB 13,10,      "4. GO BACK"
                DB 13,10,"$"
    iceCreamMsg DB       "|========================|"
                DB 13,10,"|----Choose Ice Cream----|"
                DB 13,10,"|========================|"
                DB 13,10,13,10,"   Items             | RM"
                DB 13,10,      "1. Banana Ice Cream  |  9"
                DB 13,10,      "2. Vanilla Ice Cream |  8"
                DB 13,10,      "3. Peanut Ice Cream  |  7"
                DB 13,10,      "4. GO BACK"
                DB 13,10,"$"
    enterChoiceIcMsg DB 13,10, "Enter your choice of ice cream (1-4): $"
    bananaIcMsg DB "Banana Ice Cream$"
    vanillaIcMsg DB "Vanilla Ice Cream$"
    peanutIcMsg DB "Peanut Ice Cream$"
    stockMsg DB 13,10,13,10,"Current stock for $"
    stockMsg2 DB " is $"
    enterQuantityMsg DB 13,10,"Enter the quantity (MAX $"
    enterQuantityMsg2 DB "): $"
    maxStockErrorMsg DB 13,10,"Number exceeded the maximum stock! Please enter any key to continue...$"
    cusMenuMsg  DB       "|========================|"
                DB 13,10,"  ### Customize $" 
    cusMenuMsg2 DB 13,10,"|========================|"
                DB 13,10,13,10,"   Oreo Flavours | RM"
                DB 13,10,      "1. Chocolate     | +1"
                DB 13,10,      "2. Strawberry    | +2"
                DB 13,10,      "3. Mint          | +3"
                DB 13,10,"$"
    enterFlavourMsg DB 13,10,"Enter your preferred oreo flavour (1-3): $"
    orderPriceReviewMsg1 DB "  ",13,10,20 dup ('X')
                         DB 13,10,"  Order Price Review$"
    orderPriceReviewItemMsg      DB 13,10,"Item Name : $"
    orderPriceReviewUnitPriceMsg DB 13,10,"Unit Price:   RM$"
    orderPriceReviewFlavourMsg   DB 13,10,"Flavour   : + RM$"

    ; Password
    registeredPsw db 8 dup (0)
    ; confirmPsw db 8 dup (0)
    loginPsw db 8 dup (0)
    ; BOOLEAN
    isSignedUp db 0
    containLowerCase db 0
    ; Username
    sUsername DB 9
              DB ?
              DB 9 DUP (0)
    lUsername DB 9
              DB ?
              DB 9 DUP (0)
    ; Stock and Quantity
    stockArr DB 10,4,2
    quantityArr DB 0,0,0
    priceArr DB 9,8,7
    stockQuantity1 DB 0
    stockQuantity2 DB 0
    currQuantity1 DB 0
    currQuantity2 DB 0
    currItemIndex DB ?
    currItemPrice DB ?
    ten DB 10

    signupSuccessMsg DB 13,10,"You've signed up! Your latest username is $"
    signupSuccessMsg2 DB ". Please use it to login.$"
    correctPswMsg DB 13,10,"Welcome. You've logged in successfully!$"
    wrongLoginMsg DB 13,10,"Incorrect username/password!"
                DB 13,10,"Enter 1 to retry or 2 to go back to initial menu: $"
    temp DB ?
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
        MOV CX,NUM
        MOV SI,0
        GET_ARR_LOOP:
            MOV AH,01H
            INT 21H
            MOV ARR[SI],AL
            INC SI
            LOOP GET_ARR_LOOP
    ENDM
    ;------
    ;---InputByte
    InputByte MACRO VAR
        MOV AH,01H
        INT 21H
        MOV VAR,AL
    ENDM
    ;------
    PRN_QUANTITY_MSG MACRO QUANTITY
        PRNSTR enterQuantityMsg
        MOV AX,0
        MOV AL,QUANTITY
        DIV ten
        MOV stockQuantity1,AL
        MOV stockQuantity2,AH
        ADD stockQuantity1,30H
        ADD stockQuantity2,30H
        MOV AH,02H
        MOV DL,stockQuantity1
        INT 21H
        MOV AH,02H
        MOV DL,stockQuantity2
        INT 21H
        PRNSTR enterQuantityMsg2
    ENDM
    ;------
    PRN_CURR_ITEM_NAME MACRO INDEX
        LOCAL ZERO, ONE, TWO, END
        CMP INDEX,0
        JE ZERO
        CMP INDEX,1
        JE ONE
        CMP INDEX,2
        JE TWO
        ZERO:
            PRNSTR bananaIcMsg
            JMP END
        ONE:
            PRNSTR vanillaIcMsg
            JMP END
        TWO:
            PRNSTR peanutIcMsg
            JMP END
        END:
    ENDM
    ;------ [TODO]
    PRN_NUM_TWO_DIGIT MACRO NUM
        MOV AX,0
        MOV AL,NUM
        DIV ten
        ADD AL,30H
        ADD AH,30H
        MOV temp,AH
        MOV AH,02H
        MOV DL,AL
        INT 21H
        MOV AH,02H
        MOV DL,temp
        INT 21H
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
            InputByte CHOICE
            
        ;-----Compare
        ;-----[TODO]
        CMP CHOICE,30H
        JE FOOD_MENU
        CMP CHOICE,31H
        JE SIGNUP
        CMP CHOICE,32H
        JE Login
        CMP CHOICE,33H
        JE QUIT
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        CALL CLS
        JMP START

    SIGNUP:
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
        ; Check uppercase
        xor dx, dx
        mov cx, 8
        mov bx, OFFSET registeredPsw
        UPPER_CHECK:
            mov al, [bx]
            cmp dx, 8
            je  INVALID_PSW ; prompt user that psw is invalid
            sub al, 'A'
            cmp al, 'Z' - 'A'
            jbe LOWER_CHECK
            inc bx
            inc dx
            jmp UPPER_CHECK
        ; Check lowercase
        LOWER_CHECK:
            xor dx, dx
            mov cx, 8
            mov bx, OFFSET registeredPsw
            LOWER_CHECK_INNER:
                mov al, [bx]
                cmp dx, 8
                je  INVALID_PSW ; prompt user that psw is invalid
                sub al, 'a'
                cmp al, 'z' - 'a'
                jbe NUMBER_CHECK
                inc bx
                inc dx
                jmp LOWER_CHECK_INNER
        ; Check number
        NUMBER_CHECK:
            xor dx, dx
            mov cx, 8
            mov bx, OFFSET registeredPsw
            NUMBER_CHECK_INNER:
                mov al, [bx]
                cmp dx, 8
                je  INVALID_PSW ; prompt user that psw is invalid
                sub al, '0'
                cmp al, '9' - '0'
                jbe SPECIAL_CHAR_CHECK
                inc bx
                inc dx
                jmp NUMBER_CHECK_INNER
        SPECIAL_CHAR_CHECK:
            xor dx, dx
            mov cx, 8
            mov bx, OFFSET registeredPsw
            SPECIAL_CHAR_CHECK_INNER:
                mov al, [bx]
                cmp dx, 8
                je  INVALID_PSW ; prompt user that psw is invalid
                ; sub al, '0'
                ; cmp al, '9' - '0'
                CMP AL,'!'
                JE SUCCESS_SIGNUP
                CMP AL,'#'
                JE SUCCESS_SIGNUP
                CMP AL,'@'
                JE SUCCESS_SIGNUP
                CMP AL,'?'
                JE SUCCESS_SIGNUP
                inc bx
                inc dx
                jmp SPECIAL_CHAR_CHECK_INNER 

        SUCCESS_SIGNUP:
            MOV isSignedUp,01H
            PRNSTR signupSuccessMsg
            PRNSTR_OFFSET sUsername
            PRNSTR signupSuccessMsg2
            CALL PRESS_CONT
            CALL CLS
            JMP START

        INVALID_PSW:
            PRNSTR invalidPasswordMsg
            MOV AH,01H
            INT 21H
            MOV CHOICE,AL
            CMP CHOICE,31H
            JE SIGNUP
            CMP CHOICE,32H
            JE START
            PRNSTR choiceErrorMsg
            CALL PRESS_CONT
            JMP INVALID_PSW

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
        JE FOOD_MENU
        CMP CHOICE,32H
        JE PAYMENT_MENU
        CMP CHOICE,33H
        JE START
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        CALL CLS
        JMP MAIN_MENU

    ;----------------SECTION#5#START-----------------
    ;----------------FOOD MENU-----------------------
    FOOD_MENU:
        CALL CLS
        PRNSTR foodMenuMsg
        PRNSTR ENTER_CHOICE_MSG
        ; Get choice
        MOV AH,01H
        INT 21H
        MOV CHOICE,AL
        ;-----Compare
        CMP CHOICE,31H
        JE ICE_CREAM_MENU
        CMP CHOICE,32H
        JE FOOD_MENU
        CMP CHOICE,33H
        JE FOOD_MENU
        CMP CHOICE,34H
        JE MAIN_MENU
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        JMP FOOD_MENU
    
    ICE_CREAM_MENU:
        CALL CLS
        PRNSTR iceCreamMsg
        PRNSTR ENTER_CHOICE_MSG
        ; Get choice
        MOV AH,01H
        INT 21H
        MOV CHOICE,AL
        PRNSTR stockMsg
        ;-----Compare
        CMP CHOICE,31H
        JE ICE_CREAM_BANANA_SELECTED
        CMP CHOICE,32H
        JE ICE_CREAM_VANILLA_SELECTED
        CMP CHOICE,33H
        JE ICE_CREAM_PEANUT_SELECTED
        CMP CHOICE,34H
        JE FOOD_MENU
        PRNSTR choiceErrorMsg
        CALL PRESS_CONT
        JMP ICE_CREAM_MENU
        ;-----Item Selected
        ICE_CREAM_BANANA_SELECTED:
            MOV SI,0
            MOV currItemIndex,0
            MOV AL,priceArr[0]
            MOV currItemPrice,AL
            PRN_CURR_ITEM_NAME currItemIndex
            PRNSTR stockMsg2
            ;-----Print stock quantity
            MOV AX,0
            MOV AL,stockArr[SI]
            DIV ten
            MOV stockQuantity1,AL
            MOV stockQuantity2,AH
            ADD stockQuantity1,30H
            ADD stockQuantity2,30H
            MOV AH,02H
            MOV DL,stockQuantity1
            INT 21H
            MOV AH,02H
            MOV DL,stockQuantity2
            INT 21H

            PRN_QUANTITY_MSG stockArr[SI]
            ; Get quantity
            MOV AH,01H
            INT 21H
            MOV currQuantity1,AL
            MOV AH,01H
            INT 21H
            MOV currQuantity2,AL
            sub al, '0'
            cmp al, '9' - '0'
            ; If the currQuantity2 is a digit
            JBE DOUBLE_DIGIT_CURRQUANTITY
            SINGLE_DIGIT_CURRQUANTITY:
                SUB currQuantity1,30H
                XOR AX,AX
                MOV AL,currQuantity1
                ; Verify max
                MOV BL,stockArr[SI]
                CMP AL,BL ; compare quantity with stock
                JG MAX_ERROR
                ; Assign the input quantity to the array
                MOV quantityArr[SI],AL
                JMP CUSTOMIZE_MENU
            DOUBLE_DIGIT_CURRQUANTITY:
                SUB currQuantity1,30H
                SUB currQuantity2,30H
                XOR AX,AX
                MOV AL,currQuantity1
                MUL ten
                ADD AL,currQuantity2
                ; Verify max
                MOV BL,stockArr[SI]
                CMP AL,BL ; compare quantity with stock
                JG MAX_ERROR
                ; Assign the input quantity to the array
                MOV quantityArr[SI],AL
                JMP CUSTOMIZE_MENU
        ICE_CREAM_VANILLA_SELECTED:
        ICE_CREAM_PEANUT_SELECTED:
        MAX_ERROR:
            PRNSTR maxStockErrorMsg
            MOV AH,0
            INT 16H
            JMP ICE_CREAM_MENU
    ;----------------SECTION#5#END------------------------


    ;----------------SECTION#6#START----------------------
    ;----------------CUSTOMIZE MENU-----------------------
    CUSTOMIZE_MENU:
        CALL CLS
        PRNSTR cusMenuMsg
        PRN_CURR_ITEM_NAME currItemIndex
        PRNSTR cusMenuMsg2
        PRNSTR enterFlavourMsg
        MOV AH,01H
        INT 21H
        MOV CHOICE,AL
        PRNSTR orderPriceReviewMsg1
        PRNSTR orderPriceReviewItemMsg
        PRN_CURR_ITEM_NAME currItemIndex
        PRNSTR orderPriceReviewUnitPriceMsg
        PRN_NUM_TWO_DIGIT currItemPrice
        MOV AH,00H
        INT 16H
        JMP FOOD_MENU
    ;----------------SECTION#6#END------------------------

    PAYMENT_MENU:
        JMP START


    QUIT:
        CALL CLS
        MOV AH,09H
        LEA DX,TQ_MSG
        INT 21H
        MOV AH,01H
        INT 21H
        MOV CHOICE,AL
        CMP CHOICE,31H
        JE START
        JMP TERMINATE

    TERMINATE:
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