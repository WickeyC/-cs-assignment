.MODEL SMALL
.STACK 100
.386
.DATA
    START_LOGO DB 13,10
               DB 13,10
               DB 13,10
               DB 13,10
               DB 13,10
               DB 13,10,"                         __   /\             /\   __"
               DB 13,10,"                        / /  /  \           /  \  \ \ " 
               DB 13,10,"                       / /   \/\/   ______  \/\/   \ \" 
               DB 13,10,"                       \ \         /_____/         / /" 
               DB 13,10,"                        \_\                       /_/ $"
               DB 13,10
    START_LOGO_BLINK DB "                                   WELCOME$"    ; 42
    END_LOGO   DB 13,10,"                                                    "
               DB 13,10,"               ||||||||||||||   ||||||||  |||||||| |||||||||||||| "
               DB 13,10,"               ||XXXXXXXXXX||   ||XXXX||  ||XXXX|| ||XXXXXXXXXX|| "
               DB 13,10,"               ||XX||||||XX||   ||||XX||  ||XX|||| ||XX|||||||||| "
               DB 13,10,"               ||XX||  ||XX||     ||XXXX||XXXX||   ||XX||         "
               DB 13,10,"               ||XX||||||XX||||   ||||XXXXXX||||   ||XX|||||||||| "
               DB 13,10,"               ||XXXXXXXXXXXX||     ||||XX||||     ||XXXXXXXXXX|| "
               DB 13,10,"               ||XX||||||||XX||       ||XX||       ||XX|||||||||| "
               DB 13,10,"               ||XX||    ||XX||       ||XX||       ||XX||         "
               DB 13,10,"               ||XX||||||||XX||       ||XX||       ||XX|||||||||| "
               DB 13,10,"               ||||||||||||||||       ||||||       |||||||||||||| $" 
               DB 13,10,"                                                    "
               DB 13,10
    END_LOGO_BLINK DB "                                     GOOD BYE$" ; 45
    LOGO DB 13,10,"                       __________   ____   __      __ "
         DB 13,10,"                       \______   \ /  _ \ /  \    /  \"
         DB 13,10,"                        |    |  _/ >  _ </\   \/\/   /"
         DB 13,10,"                        |    |   \/  <_\ \/\        / "
         DB 13,10,"                        |______  /\_____\ \ \__/\  /  "
         DB 13,10,"                               \/        \/      \/   $"
    INIT_MENU_MSG DB 13,10,"Welcome to B&W self-ordering kiosk!$"
    INIT_MENU DB 13,10,13,10,"                     1. Sign Up (New Customer)"
              DB 13,10,      "                     2. Login (Existing Customer)"
              DB 13,10,      "                     3. Quit$" 
    ENTER_CHOICE_MSG1 DB "Enter your choice ($"
    ENTER_CHOICE_MSG2 DB "-$"
    ENTER_CHOICE_MSG3 DB "): $"
    choiceErrorMsg    DB "Invalid number! Please enter again!$"
    selectionErrorMsg DB " Invalid selection! Please enter again!$"
    choice DB 0
    TQ_MSG DB 13,10,"                               ~~~~~~   ~~~~~~  "
           DB 13,10,"                              ~~~~~~~~ ~~~~~~~~ "
           DB 13,10,"                              ~~~~~~~~~~~~~~~~~ "
           DB 13,10,"                               ~~~~~~~~~~~~~~~  "
           DB 13,10,"                                 ~~~~~~~~~~~    "
           DB 13,10,"                                   ~~~~~~~      "
           DB 13,10,"                                     ~~~        "
           DB 13,10,"                                      ~         "
           DB 13,10,13,10,23 dup (32),30 dup (03)
           DB 13,10,23 dup (32),"Thank you for using the kiosk!"
           DB 13,10,13 dup (32),"Enter 1 to use it again or any other keys to terminate: $"
    contMsg DB "Press any key to continue...$"

    createAccMsg DB 13,10,"                            |======================|"
                 DB 13,10,"                            |-Create a New Account-|"
                 DB 13,10,"                            |======================|$"
    enterUsernameMsg DB 13,10,13,10,"                   Enter your username: $"
    enterPswMsg      DB 13,10,      "                   Enter your password: $"
    invalidUsernameMsg1 DB          "                       <<< Username cannot be empty! >>>$"
    invalidUsernameMsg2 DB 13,10,   "              Enter 1 to retry or 2 to go back to initial menu: $"  
    invalidPasswordMsg1 DB "                        <<< Sorry, invalid password! >>>$"
    invalidPasswordMsg2 DB 13,10,13,10,"            ~~~ Password must meet the following requirements ~~~"
                       DB 13,10, "            - Length of 8 letters"
                       DB 13,10, "            - Contains at least 1 uppercase and 1 lowercase letter"
                       DB 13,10, "            - Contains at least 1 number"
                       DB 13,10, "            - Contains at least 1 special character (!@#?)"
                       DB 13,10,    "              Enter 1 to retry or 2 to go back to initial menu: $"
    invalidPasswordMsg3 DB 13,10,13,10,13,10,13,10
                        DB "                    Password must be EXACTLY 8 LETTERS!$"
    notSignedUpMsg DB 13,10,10 dup (32),60 dup (18)
                   DB 13,10,"          | You haven't signed up! Please sign up before logging in. |"
                   DB 13,10,10 dup (32),60 dup (18), "$"
    loginAccMsg DB       "                          |========================|"
                DB 13,10,"                          |-Log in to your Account-|"
                DB 13,10,"                          |========================|$"

    signupSuccessMsg1 DB "You've signed up!$"
    signupSuccessMsg2 DB 13,10,13,10," ### Your latest username is $"
    signupSuccessMsg3 DB ". Please use it to login.$"
    correctPswMsg DB "Welcome. You've logged in successfully!$"
    wrongLoginMsg1 DB "                      <<< Incorrect username/password! >>>$"
    wrongLoginMsg2 DB 13,10,"              Enter 1 to retry or 2 to go back to initial menu: $"

    mainMenuMsg  DB 13,10,"                        |===========================|"
                 DB 13,10,"                          ### Welcome, $" 
    mainMenuMsg2 DB 13,10,"                        |===========================|"
                 DB 13,10,13,10,"                        1. Place order"
                 DB 13,10,      "                        2. Make payment"
                 DB 13,10,      "                        3. Logout"
                 DB 13,10,"$"
    foodMenuMsg DB 13,10,"                         |===========================|"
                DB 13,10,"                         |---------Food Menu---------|"
                DB 13,10,"                         |===========================|"
                DB 13,10,13,10,"                         Categories"
                DB 13,10,      "                         1. Ice Cream"
                DB 13,10,      "                         2. Cake"
                DB 13,10,      "                         3. Drinks"
                DB 13,10,      "                         4. Pure Oreo Cookies"
                DB 13,10,      "                         5. GO BACK"
                DB 13,10,"$"
    ; <- Max Item Type Reached ->
    maxItemMsg  DB 13,10,13,10,"                     -----------------------------------------"
                DB 13,10,      "                     | Sorry, you can't order more items. :( |"
                DB 13,10,      "                     -----------------------------------------"
                DB 13,10,      "                 The maximum total types of items in an order is 6."
                DB 13,10,13,10,"                     If you wish to order more types of items, "
                DB 13,10,      "                     you can do one of the following:"
                DB 13,10,13,10,"                     1. Order through counter"
                DB 13,10,      "                     2. Make payment and order again"
                DB 13,10,13,10,"                     Press any key to go back...$"
    ; <- Ice Cream ->
    iceCreamMsg DB 13,10,      "                        |=============================|"
                DB 13,10,      "                        |------Choose Ice Cream-------|"
                DB 13,10,      "                        |=============================|"
                DB 13,10,13,10,"                           Items             |     RM |"
                DB 13,10,      "                        -------------------------------"
                DB 13,10,      "                        1. Banana Ice Cream  |  11.99 |"
                DB 13,10,      "                        2. Vanilla Ice Cream |  10.99 |"
                DB 13,10,      "                        3. Peanut Ice Cream  |   9.49 |"
                DB 13,10,      "                        -------------------------------"
                DB 13,10,      "                        4. GO BACK"
                DB 13,10,"$"
    bananaIcMsg  DB "Banana Ice Cream$"
    vanillaIcMsg DB "Vanilla Ice Cream$"
    peanutIcMsg  DB "Peanut Ice Cream$"
    ; <- Cake -->
    cakeMsg DB 13,10,      "                        |==============================|"
            DB 13,10,      "                        |---------Choose Cake----------|"
            DB 13,10,      "                        |==============================|"
            DB 13,10,13,10,"                           Items              |     RM |"
            DB 13,10,      "                        --------------------------------"
            DB 13,10,      "                        1. Cheese Cake        |   5.50 |"
            DB 13,10,      "                        2. Green Tea Cake     |   6.60 |"
            DB 13,10,      "                        3. Mocha Cake         |   7.70 |"
            DB 13,10,      "                        -------------------------------"
            DB 13,10,      "                        4. GO BACK"
            DB 13,10,"$"
    cheeseCakeMsg   DB "Cheese Cake$"
    greenTeaCakeMsg DB "Green Tea Cake$"
    mochaCakeMsg    DB "Mocha Cake$"
    ; <- Drinks ->
    drinksMsg DB 13,10,      "                        |==============================|"
              DB 13,10,      "                        |--------Choose Drinks---------|"
              DB 13,10,      "                        |==============================|"
              DB 13,10,13,10,"                           Items              |     RM |"
              DB 13,10,      "                        --------------------------------"
              DB 13,10,      "                        1. Americano          |  13.00 |"
              DB 13,10,      "                        2. Iced Espresso      |  16.00 |"
              DB 13,10,      "                        3. Macchiato          |  10.00 |"
              DB 13,10,      "                        -------------------------------"
              DB 13,10,      "                        4. GO BACK"
              DB 13,10,"$"
    americanoMsg    DB "Americano$"
    icedEspressoMsg DB "Iced Espresso$"
    macchiatoMsg    DB "Macchiato$"

    pureOreoMsg DB "Pure Oreo Cookies$"

    stockMsg  DB 13,10,13,10,"  ### Current stock for $"
    stockMsg2 DB " is $"
    enterQuantityMsg  DB 13,10,"                        Enter the quantity (MAX $"
    enterQuantityMsg2 DB "): $"
    maxStockErrorMsg  DB "Number exceeded the maximum stock! Please enter any key to continue...$"
    invalidQuantity1Msg DB "Invalid quantity! Enter first digit from 1 to 9 only!$"
    invalidQuantity2Msg DB "Invalid quantity! For 2nd digit, only enter key or 0 to 9 are allowed!$"
    confirmContMsg DB "Confirm to continue? (Y for Yes / Other keys for No): $"

    ; <- Customize Menu ->
    cusMenuMsg  DB 13,10,      "             |===================================================|"
                DB 13,10,      "               ### Customize $" 
    cusMenuMsg2 DB 13,10,      "             |===================================================|"
                DB 13,10,13,10,"                 Oreo Flavour |    RM       Oreo Varierty |    RM"
                DB 13,10,32,13 dup (32),51 dup (240)
                DB 13,10,      "              1. Original     |  Free    5. Normal        |  Free"
                DB 13,10,      "              2. Chocolate    | +0.50    6. Mini          | +0.49"
                DB 13,10,      "              3. Strawberry   | +1.00    7. Crunch        | +1.20"
                DB 13,10,      "              4. Mint         | +1.50"
                DB 13,10,"$"
    enterFlavourMsg DB 13,10,"              Enter your preferred oreo flavour (1-4): $"
    enterVarietyMsg DB 13,10,"              Enter your preferred oreo variety (5-7): $"
    cusConfirmMsg1  DB 13,10,13,10,"              Your selection$"
    cusFlaMsg       DB 13,10,      "              Flavour $"
    cusVarMsg       DB 13,10,      "              Variety $"
    cusConfirmMsg2  DB 13,10,13,10,"              Is it correct? (Y for Yes / Other keys for No): $"

    ; <- Review Menu ->
    orderPriceReviewMsg1 DB 13,10,30 dup (32),18 dup (254)
                         DB 13,10,         "                              Order Price Review"
                         DB 13,10,30 dup (32),18 dup (254)
                         DB "$"
    orderPriceReviewItemMsg DB 13,10,13,10,"                         Item Name   : $"
    orderPriceReviewUnitPriceMsg  DB 13,10,"                         Unit Price  : RM   $"
    orderPriceReviewFlavourMsg    DB 13,10,"                         Flavour     : RM +  $"
    orderPriceReviewVarietyMsg    DB 13,10,"                         Variety     : RM +  $"
    orderPriceReviewQuantityMsg   DB 13,10,"                         Quantity    :         $"
    orderPriceReviewOrderPriceMsg DB 13,10,13,10,"                         Order Price : RM  $"
    orderRecordedSuccessMsg DB "Order is recorded in the system succesfully!$"
    afterOrderRecordMsg DB 13,10,13,10,"                            1. Go to main menu"
                        DB 13,10,      "                            2. Make payment"
                        DB 13,10,      "                            3. Order again"
                        DB 13,10,13,10,"                       Enter your choice (1-3): $"
    ; <- REVIEW_MENU ->
    hasNoOrderMsg  DB 13,10,13,10,"                     -------------------------------------"
                   DB 13,10,      "                     | You haven't placed any order yet! |"
                   DB 13,10,      "                     -------------------------------------"
                   DB 13,10,      "                     Press any key to go back...$"
    reviewMenuMsg  DB 13,10,"                |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|"
                   DB 13,10,"                |--              Review Purchase            --|"
                   DB 13,10,"                |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\|"
                   DB 13,10,"       ------------------------------------------------------------------"
                   DB 13,10,"       | ITEMS                   | OREO CHOICES | QUANTITY | PRICE (RM) |"
                   DB 13,10,"       ------------------------------------------------------------------$"
    oreo_ORIGINAL   DB 10H,32,"Original$"
    oreo_CHOCOLATE  DB 10H,32,"Chocolate$"
    oreo_STRAWBERRY DB 10H,32,"Strawberry$"
    oreo_MINT       DB 10H,32,"Mint$"
    oreo_NORMAL     DB 10H,32,"Normal$"
    oreo_MINI       DB 10H,32,"Mini$"
    oreo_CRUNCH     DB 10H,32,"Crunch$"
    reviewTotalMsg DB 13,10,"       ------------------------------------------------------------------"
                   DB 13,10,"                                                     TOTAL : $"
    reviewEndMsg DB 13,10,13,10,"                1. Proceed to pay"
                 DB 13,10,      "                2. Go back to main menu$"
    ; <- RECEIPT_MENU ->
    receiptMenuMsg DB 13,10,      "                   |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/| "
                   DB 13,10,      "                   |--            Your Bill            --| "
                   DB 13,10,      "                   |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\| "
                   DB 13,10,13,10,"                   Do you want to use a voucher? (Y/N): $"
    enterVoucherMsg   DB 13,10,   "                   Enter the voucher code: $"
    voucherAppliedMsg DB          "                   Voucher Applied Successfully!$"
    invalidVoucherMsg DB          "                   Invalid Voucher!$"
    totalExclSSTMsg   DB 13,10,   "                   Total (Excl SST)    : RM $"
    voucherDiscountMsg1 DB 13,10, "                   Voucher Discount $"
    voucherDiscountMsg2 DB "% : RM $"
    afterDiscountMsg  DB 13,10,   "                   After Discount      : RM $"
    SSTChargeMsg      DB 13,10,   "                   6% SST Charge       : RM $"
    totalInclSSTMsg   DB 13,10,   "                   Total (Incl SST)    : RM $"
    roundingAdjMsg    DB 13,10,   "                   Rounding Adj        : RM $"
    totalMsg          DB 13,10,   "                   TOTAL               : RM $"
    ; <- CHOOSE_PM_MENU ->
        choosePmMsg DB 13,10,      "                   |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/| "
                    DB 13,10,      "                   |--      Choose Payment Method      --| "
                    DB 13,10,      "                   |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\| "
                    DB 13,10,13,10,"                   1. Cash"
                    DB 13,10,      "                   2. Credit Card"
                    DB 13,10,      "                   3. Go back to review purchase"
                    DB 13,10,13,10,"                   Enter your choice (1-3): $"
    ; <- CASH ->
        cashPayMsg DB 13,10,            "                    |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/| "
                DB 13,10,            "                    |--          Pay with Cash          --| "
                DB 13,10,            "                    |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\| "
                DB 13,10,13,10,      "                    Total Amount to Pay : RM $"
        enterCashMsg DB 13,10,13,10,    "                    Enter Pay Amount    : RM $"
        insufficientMsg DB            "               Insufficient Amount! Press any key to re-enter...$"
        payChangeMsg    DB "Change Value        : RM $"
    ; <- CREDIT_CARD ->
        cardPayMsg DB 13,10,            "                    |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/| "
                DB 13,10,            "                    |--       Pay with Credit Card      --| "
                DB 13,10,            "                    |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\| "
                DB 13,10,13,10,      "                    Total Amount to Pay: RM $"
        enterCardMsg DB 13,10,13,10,    "                    Enter Card Number  : $"
        invalidCardNumDigitMsg DB            "           Card Number must be digit only! Press any key to re-enter...$"
        invalidCardMsg         DB "                          <<< Invalid Card Number! >>>"
                            DB 13,10,"         This card number does not pass through the validation check.$"
        successPaymentMsg      DB "              Successfully paid with card. Thank you for your order.$"
    ; <- Payment Successful Message ->
    paymentSuccess DB 13,10,        "                    |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/| "
                   DB 13,10,        "                    |--         PAYMENT SUCCESS!        --| "
                   DB 13,10,        "                    |\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\| $"
    ; <- Dine Method + Ref Code ->
    dineOutEatInMsg DB 13,10
                    DB 13,10,     "                          _______"
                    DB 13,10,     "                         |       |                 ______"
                    DB 13,10,     "                      <--| .     |               =========="
                    DB 13,10,     "                         |       |                   ||"
                    DB 13,10,     "                         |       |                   ||"
                    DB 13,10,     "                   ================                 ^^^^"
                    DB 13,10
                    DB 13,10,     "                 --- 1 : DINE OUT ---        --- 2 : EAT IN ---"      
                    DB 13,10
                    DB 13,10,     "                                   CHOICE : $"      
    dineOutMsg DB " - DINE OUT$"
    eatInMsg   DB " - EAT IN$"
    refMsg     DB 'Your Referral Code Number is$'
    easterEggMsg DB 13,10,13,10,13,10,13,10,13,10,13,10,13,10
                 DB                 "                            VOUCHER CODE : ULTRAMAN$"
    ; @ Username
        username  DB 16
                  DB ?
                  DB 16 DUP ("$")
        sUsername DB 16
                  DB ?
                  DB 16 DUP ("$")
        lUsername DB 16
                  DB ?
                  DB 16 DUP ("$")
    ; @ Password
        registeredPsw DB 8 dup (0)
        loginPsw      DB 8 dup (0)
        psw           DB 8 dup (0)
    ; # BOOLEAN
        isSignedUp DB 0
        hasOrder   DB 0
    ; * Stock
        stockArr DW 96,83,99,88,89,76,89,84,90,87
    ; * Quantity
        quantityArr DW 0,0,0,0,0,0,0,0,0,0
    ; * Unit Price
        unitPriceIntArr DW 11,10, 9, 5, 6, 7,13,16,10, 1
        unitPriceManArr DW 99,99,49,50,60,70,00,00,00,00
    ; * Flavour and Variety
        flavourPriceIntArr DW 0,0,1,1
        flavourPriceManArr DW 0,50,0,50
        varietyPriceIntArr DW 0,0,1
        varietyPriceManArr DW 0,49,20
        flaVarTracker DW 0,0,0,0,0,0,0,0,0,0
        currItemFlavour DB 0 ; 1/2/3/4
        currItemVariety DB 0 ; 5/6/7
        currItemFlaVarTracker DW 0 ; 4 * 3 = 12 permutations
        currFlavourPriceInt DW ?
        currFlavourPriceMan DW ?
        currVarietyPriceInt DW ?
        currVarietyPriceMan DW ?
    ; * Order Price
        currOrderPriceInt DW 0
        currOrderPriceMan DW 0
        orderPriceIntArr DW 0,0,0,0,0,0,0,0,0,0
        orderPriceManArr DW 0,0,0,0,0,0,0,0,0,0
    ; * Receipt
        totalPriceExclSST_INT DW 0
        totalPriceExclSST_MAN DW 0
        discount_INT DW 0
        discount_MAN DW 0
        discountedPrice_INT DW 0
        discountedPrice_MAN DW 0
        SSTCharge_INT DW 0
        SSTCharge_MAN DW 0
        totalPriceInclSST_INT DW 0
        totalPriceInclSST_MAN DW 0
        rounding_INT DW 0
        rounding_MAN DW 0
        finalTotal_INT DW 0
        finalTotal_MAN DW 0
    ; * Payment Cash/Card
        payAmount_INT DW 0
        payAmount_MAN DW 0
        payChange_INT DW 0
        payChange_MAN DW 0
        cardNumber DB 16 dup (0)
        cardSum DB 0
    ; @ Voucher Code
        vcode1 DB "BANDW$"    ; 5%
        vcode2 DB "BACS$"     ; 4%
        vcode3 DB "ULTRAMAN$" ; 3%
        ucode  DB 16
               DB ?
               DB 16 DUP (0)
    ; @ Referral Code
        RanRefCode1 DW 0
        RanRefCode2 DW 0
        RefCode     DB 9 DUP (0)
        fileName    DB "REFCODE.txt$"
        HANDLE      DW 0
    ;--------------------
        currQuantity1 DB 0
        currQuantity2 DB 0
    ;--------------------
        currItemIndex DW ?
    ;--------------------
        PERCENTAGE DW ?
        CHANGE_VAL DW ?, ?
        CHANGE_VAL_INT DW ?
        CHANGE_VAL_MAN DW ?
        FloatCarry    DW ? ; For Addition
        FloatOverflow DW ? ; For Multiply

    ; <<< Utilities >>>
        DOT        DB '.'
        dotPressed DB 0
        counter    DB ?
        temp       DB ?
        tempWORD   DW ?
        ten        DB 10
        NL_1       DB 13,10
                   DB "$"
        NL_2       DB 13,10,13,10
                   DB "$"
        ITEM_LENGTH_TIMES_TWO DW 20
        MAX_ITEM_TYPE_IN_ORDER DW 6
        CURR_ITEM_TYPE_IN_ORDER DW 0
        ITEM_TYPE_IN_ORDER DW 0,0,0,0,0,0,0,0,0,0 ; 0 if not ordered, 1 if ordered
.CODE
MAIN PROC
    ; <<<<<<<<<<<< GENERIC MACROS >>>>>>>>>>>>
        INPUT_BYTE MACRO B
            MOV AH,01H
            INT 21H
            MOV B,AL
        ENDM
        OUTPUT_BYTE MACRO B
            MOV AH,02H
            MOV DL,B
            INT 21H
        ENDM
        ;------
        PRNSTR MACRO STR
            MOV AH,09H
            LEA DX,STR
            INT 21H
        ENDM
        PRNSTR_OFFSET MACRO STR
            MOV ah,09H
            mov dx, offset STR + 2 ; MUST END WITH '$'.
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
        GET_PW_ARR MACRO ARR, NUM
            LOCAL GET_ARR_LOOP,LENGTH_ERROR,DelNo,DelNull,END
            MOV CX,NUM
            MOV SI,0
            GET_ARR_LOOP:
                    PUSH CX
                    XOR CX,CX
                    XOR DX,DX
                    MOV AH,03H 
                    INT 10H
                    POP CX
                    PUSH DX
                    MOV AH,07H
                    INT 21H
                    CMP AL,0DH
                    JE LENGTH_ERROR
                    CMP AL,08H
                    JE DelNo
                    MOV ARR[SI],AL
                    POP DX
                    INC SI
                    MOV AH,02H
                    MOV DL,2AH
                    INT 21H
                    LOOP GET_ARR_LOOP
                    JMP END
                DelNo:
                    ; Reverse Input
                    POP DX
                    PUSH CX 
                    CMP SI,0
                    JE DelNull
                    POP CX
                    INC CX
                    PUSH CX
                    DEC SI
                    MOV ARR[SI],0
                    ; Set minus one cursor position
                    DEC DL
                    MOV AH,02H
                    INT 10H
                    PUSH DX
                    ; Print Space
                    MOV AH,02H
                    MOV DL,20H
                    INT 21H
                    ; Set Back Cursor Position
                    POP DX
                    MOV AH,02H
                    INT 10H
                    DelNull:
                    POP CX 
                    JMP GET_ARR_LOOP
                LENGTH_ERROR:
                    PRNSTR invalidPasswordMsg3
                    POP DX
                    PUSH CX
                    MOV AH,02H 
                    INT 10H
                    POP CX
                    JMP GET_ARR_LOOP
                END:
        ENDM
        ;------
        PRN_CURR_ITEM_NAME MACRO INDEX
            LOCAL L0, L1, L2, L3, L4, L5, L6, L7, L8, L9, END
            CMP INDEX,0
            JE L0
            CMP INDEX,1
            JE L1
            CMP INDEX,2
            JE L2
            CMP INDEX,3
            JE L3
            CMP INDEX,4
            JE L4
            CMP INDEX,5
            JE L5
            CMP INDEX,6
            JE L6
            CMP INDEX,7
            JE L7
            CMP INDEX,8
            JE L8
            CMP INDEX,9
            JE L9
            L0:
                PRNSTR bananaIcMsg
                JMP END
            L1:
                PRNSTR vanillaIcMsg
                JMP END
            L2:
                PRNSTR peanutIcMsg
                JMP END
            L3:
                PRNSTR cheeseCakeMsg
                JMP END
            L4:
                PRNSTR greenTeaCakeMsg
                JMP END
            L5:
                PRNSTR mochaCakeMsg
                JMP END
            L6:
                PRNSTR americanoMsg
                JMP END
            L7:
                PRNSTR icedEspressoMsg
                JMP END
            L8:
                PRNSTR macchiatoMsg
                JMP END
            L9:
                PRNSTR pureOreoMsg
                JMP END
            END:
        ENDM
        PRN_OREO_CHOICE MACRO CODE
            LOCAL ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, END
            CMP CODE,1
            JE ONE
            CMP CODE,2
            JE TWO
            CMP CODE,3
            JE THREE
            CMP CODE,4
            JE FOUR
            CMP CODE,5
            JE FIVE
            CMP CODE,6
            JE SIX
            CMP CODE,7
            JE SEVEN
            ONE:
                PRNSTR oreo_ORIGINAL
                JMP END
            TWO:
                PRNSTR oreo_CHOCOLATE
                JMP END
            THREE:
                PRNSTR oreo_STRAWBERRY
                JMP END
            FOUR:
                PRNSTR oreo_MINT
                JMP END
            FIVE:
                PRNSTR oreo_NORMAL
                JMP END
            SIX:
                PRNSTR oreo_MINI
                JMP END
            SEVEN:
                PRNSTR oreo_CRUNCH
                JMP END
            END:
        ENDM
        ;------
        PRNSTR_COLOR MACRO STR, LEN, COLOR
            MOV AH,9
            MOV BH,0
            MOV BL,COLOR ; <--- color
            MOV CX,LEN   ; <--- number of chars
            INT 10H
            LEA DX,STR
            INT 21H
        ENDM
        ;------
        PRN_CHOICE_MSG MACRO MIN,MAX
            PUSH BX
            MOV BL,MIN
            ADD BL,30H
            MOV BH,MAX
            ADD BH,30H
            PRNSTR ENTER_CHOICE_MSG1
            OUTPUT_BYTE BL
            PRNSTR ENTER_CHOICE_MSG2
            OUTPUT_BYTE BH
            PRNSTR ENTER_CHOICE_MSG3
            POP BX
        ENDM
        ;------
        PRN_WHSP MACRO LEN
            LOCAL PRN_WHSP_LOOP
            OUTPUT_BYTE 13
            OUTPUT_BYTE 10
            MOV CX,LEN
            PRN_WHSP_LOOP:
                OUTPUT_BYTE " "
                LOOP PRN_WHSP_LOOP
            ENDM
        DELAY MACRO TIMELEN
            LOCAL PASS1, PASS2
            MOV DI,TIMELEN
            PASS1: MOV CX,TIMELEN
            PASS2: LOOP PASS2
            DEC DI
            JNZ PASS1
        ENDM
        ;------
        SET_CURSOR MACRO ROW, COL
            PUSH CX
            MOV AH,3    ; Get the current cursor position
            MOV BH,0
            INT 10H
            MOV AH,2    ; Set cursor position
            MOV BH,0
            MOV DH,ROW
            MOV DL,COL
            INT 10H
            POP CX
        ENDM
    ; <<<<<<<<<<<< End of Macros >>>>>>>>>>>>
    ; <<<<< CALCULATION MACROS >>>>>
        ;---Get Floating Point Input---
            GET_FLOAT_INPUT MACRO Integer,Mantissa
                LOCAL DOT_PRESSED,END
                GET_INT_INPUT Integer
                XOR AX,AX
                MOV AL,dotPressed
                CMP AL,1
                JE DOT_PRESSED
                    MOV Mantissa,0
                    JMP END
                DOT_PRESSED:
                OUTPUT_BYTE DOT
                GET_MAN_INPUT Mantissa
                END:
                MOV dotPressed,0
            ENDM
            GET_INT_INPUT MACRO INP
                LOCAL InputNo,FormNo,ViewNo,DelNo,VALIDATE_TYPE
                MOV CX,0
                InputNo:
                    MOV AH,00H
                    INT 16H
                    MOV DX,0
                    MOV BX,1
                    CMP CX,0
                    JE VALIDATE_TYPE
                    CMP AL,08H ; Backspace
                    JE DelNo
                    CMP AL,0DH ; Enter Key
                    JE FormNo
                    MOV dotPressed,1
                    CMP AL,2EH ; '.'
                    JE FormNo
                    MOV dotPressed,0
                    ; Validation
                    ; Type Check:
                    VALIDATE_TYPE:
                    CMP AL,'0'
                    JB InputNo
                    CMP AL,'9'
                    JA InputNo
                    ; Range Check:
                    CMP CX,4 ; Fix 4 digits
                    JAE InputNo
                    CALL ViewNo
                    MOV AH,00H
                    SUB AL,30H
                    PUSH AX 
                    INC CX 
                    JMP InputNo
                DelNo:
                    POP AX 
                    DEC CX 
                    PUSH CX 
                    ;Get Cursor Position 
                    MOV AH,03H ;DH = Row, DL = Column
                    INT 10H
                    ;Set Minus one cursor position
                    DEC DL
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
                    POP CX 
                    JMP InputNo
                ViewNo:
                    PUSH DX 
                    MOV DX,AX 
                    MOV AH,02H
                    INT 21H
                    POP DX 
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
            GET_MAN_INPUT MACRO INP
                LOCAL InputNo,FormNo,ViewNo,Assignzero,Formtenths,Formhundreths,Mantissa_Error,DelNo,VALIDATE_TYPE,END
                MOV CX,0
                InputNo:
                    MOV AH,00H
                    INT 16H
                    MOV DX,0
                    MOV BX,1
                    CMP AL,0DH ; Enter Key
                    JE FormNo
                    CMP CX,0
                    JE VALIDATE_TYPE
                    CMP AL,08H ; Backspace
                    JE DelNo
                    ;---Validation
                    ; Type Check:
                    VALIDATE_TYPE:
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
                    POP AX 
                    DEC CX
                    PUSH CX 
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
                    POP CX 
                    JMP InputNo
                ViewNo:
                    PUSH DX 
                    MOV DX,AX 
                    MOV AH,02H
                    INT 21H
                    POP DX  
                    RET
                FormNo: 
                CMP CX,0
                JE Assignzero
                CMP CX,2
                JE Formhundreths
                ; CX = 0 | Assign zero:
                Assignzero:
                    MOV INP,0
                    JMP END
                ; CX = 1 | Form tenths:
                Formtenths:
                    POP AX
                    MOV BX,10
                    MUL BX
                    MOV INP,AX
                    DEC CX
                    JMP END
                ; CX = 2 | Form hundreths:
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
            ; FUNCTIONALITY
            DIV100 MACRO X,RES,REM
                XOR DX,DX
                MOV AX,X
                MOV CX,100
                DIV CX
                MOV RES,AX
                MOV REM,DX
            ENDM
            ; FLOATING POINT
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
                SUBTRACTION BX,SINT,RESINT
                POP BX
                SUBTRACTION BX,SMAN,RESMAN
                JMP END

                SUB_without_BORROW:
                    SUBTRACTION FINT,SINT,RESINT
                    SUBTRACTION FMAN,SMAN,RESMAN

                END:
            ENDM
            MULTIPLICATION_FLT MACRO multiplicandINT,multiplicandMAN,multiplier,resultINT,resultMAN
                LOCAL END
                MULTIPLICATION multiplicandINT,multiplier,resultINT
                MULTIPLICATION multiplicandMAN,multiplier,resultMAN
                ; HANDLE OVERFLOW
                DIV100 resultMAN,FloatOverflow,resultMAN
                CMP FloatOverflow,0
                JE END
                ADDITION resultINT, FloatOverflow, resultINT
                END:
            ENDM
            ; TAX AND DISCOUNT
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
            ; ROUNDING OFF
            ROUNDOFF MACRO Integer,Mantissa
                LOCAL END,CHKCarry
                XOR DX,DX
                MOV AX,Mantissa ; 99
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
                DIV CX 
                ; DX = Floatcarry
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
                OUTPUT_FIVEDIGITS NUM
                JMP END

                CHK4:
                CMP NUM,999
                JBE CHK3
                OUTPUT_FOURDIGITS NUM
                JMP END

                CHK3:
                CMP NUM,99
                JBE CHK2
                OUTPUT_THREEDIGITS NUM
                JMP END

                CHK2:
                CMP NUM,9
                JBE PRT1
                OUTPUT_TWODIGITS NUM
                JMP END

                PRT1:
                OUTPUT_ONEDIGIT NUM

                END:
            ENDM
            OUTPUT_NUM MACRO NUM
                LOCAL CHK5,CHK4,CHK3,CHK2,PRT1,END
                CHK5:
                CMP NUM,9999
                JBE CHK4 
                OUTPUT_FIVEDIGITS NUM
                JMP END

                CHK4:
                CMP NUM,999
                JBE CHK3
                OUTPUT_FOURDIGITS NUM
                JMP END

                CHK3:
                CMP NUM,99
                JBE CHK2
                OUTPUT_THREEDIGITS NUM
                JMP END

                CHK2:
                CMP NUM,9
                JBE PRT1
                OUTPUT_TWODIGITS NUM
                JMP END

                PRT1:
                OUTPUT_ONEDIGIT NUM

                END:
            ENDM
            OUTPUT_FLOAT MACRO Integer,Mantissa
                OutputCalcResult Integer
                OUTPUT_BYTE "."
                OUTPUT_TWODIGITS Mantissa
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
            OUTPUT_ONEDIGIT MACRO NUM
                MOV DX,NUM
                ADD DX,30H
                MOV DX,DX
                MOV AH,02H
                INT 21H
            ENDM
            OUTPUT_TWODIGITS MACRO NUM
                LOCAL PRINT2
                MOV DX,NUM ;10 
                XOR CX,CX 
                MOV CX,10 
                PRINT2:
                MOV AX,DX ;0 
                MOV DX,0    
                DIV CX ; AX = 1, DX = 0
                ViewNo  
                MOV BX,DX  ; BX = 0
                MOV DX,0   ; 0
                MOV AX,CX ; 10
                MOV CX,10 
                DIV CX ; 1
                MOV DX,BX ; DX = 0
                MOV CX,AX ;1
                CMP AX,0
                JNE PRINT2
            ENDM    
            OUTPUT_THREEDIGITS MACRO NUM
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
            OUTPUT_FOURDIGITS MACRO NUM
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
            OUTPUT_FIVEDIGITS MACRO NUM
                LOCAL PRINT5
                MOV DX,NUM 
                XOR CX,CX
                MOV CX,10000
                PRINT5:  
                MOV AX,DX  ; 12345
                MOV DX,0  
                DIV CX     ; 1
                ViewNo  
                ; PUSH AX  ; 1
                ; PUSH DX  ; 2345
                ; MOV DX,AX  
                ; ADD DL,30H 
                ; MOV AH,02H 
                ; INT 21H  ; 1
                ; POP DX   ; 2345
                ; POP AX   ; 1
                MOV BX,DX  ; 2345
                MOV DX,0    
                MOV AX,CX  ; 10000 
                MOV CX,10 
                DIV CX     ; AX = 1000
                MOV DX,BX  ; 2345
                MOV CX,AX  ; CX = 1000
                CMP AX,0 
                JNE PRINT5
            ENDM
    ; <<<<< END OF CALCULATION MACROS >>>>

    MOV AX,@DATA
    MOV DS,AX

    
    ;---------------------SECTION#0--------------------------------
    ;---------------------Starting Up------------------------------
            CALL CLS
            PRNSTR START_LOGO
            PRNSTR NL_2
            PRNSTR NL_1
            PRNSTR_COLOR START_LOGO_BLINK,42,0BAH
            PRNSTR NL_2
            PRNSTR NL_2
            PRNSTR NL_2
            PRNSTR NL_2
            PRNSTR NL_2
            PRNSTR NL_1
            DELAY 3000
        START:
            CALL CLS
            CALL RESET_PROC
            PRNSTR LOGO
            PRNSTR INIT_MENU
            ;-----Get choice
            PRN_WHSP 21
            PRN_CHOICE_MSG 1,3
            INPUT_BYTE CHOICE
            
            ;-----Compare
            CMP CHOICE,31H
            JE SIGNUP
            CMP CHOICE,32H
            JE Login
            CMP CHOICE,33H
            JE QUIT
            CMP CHOICE,'U'
            JE EASTER_EGG
            CMP CHOICE,'u'
            JE EASTER_EGG
            PRNSTR NL_1
            PRN_WHSP 19
            PRNSTR_COLOR choiceErrorMsg,54,34H
            PRN_WHSP 19
            CALL PRESS_CONT
            CALL CLS
            JMP START
    ;---------------------END OF SECTION#0-------------------------

    ;---------------------SECTION#1--------------------------------
    ;---------------------User Sign Up & Login---------------------
    SIGNUP:
        CALL CLS
        PRNSTR createAccMsg
        ;---Get register username
        PRNSTR enterUsernameMsg
        ;---INPUT STRING for sUsername
        MOV AH,0AH
        MOV DX, OFFSET sUsername
        INT 21H
        ;---CHANGE CHR(13) BY '$'.
            MOV SI, OFFSET sUsername + 1 ; NUMBER OF CHARACTERS ENTERED.
            MOV CL,[SI] ; MOVE LENGTH TO CL.
            MOV CH,0    ; CLEAR CH TO USE CX. 
            INC CX      ; TO REACH CHR(13).
            ADD SI,CX   ; NOW SI POINTS TO CHR(13).
            MOV AL,'$'
            MOV [SI],AL ; REPLACE CHR(13) BY '$'.
        MOV BL,sUsername+1
        CMP BL,0
        JE INVALID_USERNAME
        ;---Get register password
        PRNSTR enterPswMsg
        GET_PW_ARR registeredPsw, 8
        ;---Check uppercase
        XOR DX,DX
        MOV CX,8
        MOV BX, OFFSET registeredPsw
        UPPER_CHECK:
            MOV AL,[BX]
            CMP DX,8
            JE  INVALID_PSW ; prompt user that psw is invalid
            SUB AL,'A'
            CMP AL,'Z' - 'A'
            JBE LOWER_CHECK
            INC BX
            INC DX
            JMP UPPER_CHECK
        ;---Check lowercase
        LOWER_CHECK:
            XOR DX,DX
            MOV CX,8
            MOV BX, OFFSET registeredPsw
            LOWER_CHECK_INNER:
                MOV AL,[BX]
                CMP DX,8
                JE  INVALID_PSW ; prompt user that psw is invalid
                SUB AL,'a'
                CMP AL,'z' - 'a'
                JBE NUMBER_CHECK
                INC BX
                INC DX
                JMP LOWER_CHECK_INNER
        ;---Check number
        NUMBER_CHECK:
            XOR DX,DX
            MOV CX,8
            MOV BX, OFFSET registeredPsw
            NUMBER_CHECK_INNER:
                MOV AL,[BX]
                CMP DX,8
                JE  INVALID_PSW ; prompt user that psw is invalid
                SUB AL,'0'
                CMP AL,'9' - '0'
                JBE SPECIAL_CHAR_CHECK
                INC BX
                INC DX
                JMP NUMBER_CHECK_INNER
        ;---Check 4 special characters
        SPECIAL_CHAR_CHECK:
            XOR DX,DX
            MOV CX,8
            MOV BX, OFFSET registeredPsw
            SPECIAL_CHAR_CHECK_INNER:
                MOV AL,[BX]
                CMP DX,8
                JE INVALID_PSW ; prompt user that psw is invalid
                CMP AL,'!'
                JE SUCCESS_SIGNUP
                CMP AL,'#'
                JE SUCCESS_SIGNUP
                CMP AL,'@'
                JE SUCCESS_SIGNUP
                CMP AL,'?'
                JE SUCCESS_SIGNUP
                INC BX
                INC DX
                JMP SPECIAL_CHAR_CHECK_INNER 

        SUCCESS_SIGNUP:
            ;-----Copy sUsername to username
            LEA SI,username
            LEA DI,sUsername
            ADD SI,2
            ADD DI,2
            COPY_USERNAME:
                MOV BL,BYTE PTR[DI]
                MOV BYTE PTR[SI],BL
                INC SI
                INC DI
                CMP BYTE PTR[DI],"$"
                JNE COPY_USERNAME
            MOV BX,00
            MOV BL,username+1
            MOV BH,sUsername+1
            MOV username+1,BH
            ;-----Copy registeredPsw to psw
            MOV CX,8
            MOV SI,0
            COPY_PSW:
                MOV BL,registeredPsw[SI]
                MOV psw[SI],BL
                INC SI
                LOOP COPY_PSW

            MOV isSignedUp,01H
            PRNSTR NL_1
            PRN_WHSP 32
            PRNSTR_COLOR signupSuccessMsg1,17,3AH
            PRNSTR signupSuccessMsg2
            PRNSTR_OFFSET sUsername
            PRNSTR signupSuccessMsg3
            PRN_WHSP 1
            CALL PRESS_CONT
            CALL CLS
            JMP START

        INVALID_USERNAME:
            PRNSTR NL_2
            PRNSTR_COLOR invalidUsernameMsg1,56,34H
            PRNSTR invalidUsernameMsg2
            INVALID_USERNAME_CHOICE_ERROR:
            SET_CURSOR 8,64
            MOV AH,02H
            MOV DL,20H
            INT 21H
            SET_CURSOR 8,64
            INPUT_BYTE CHOICE
            CMP CHOICE,31H
            JE SIGNUP
            CMP CHOICE,32H
            JE START
            PRN_WHSP 22
            PRNSTR_COLOR choiceErrorMsg,35,34H
            PRNSTR NL_1
            PRN_WHSP 26
            CALL PRESS_CONT
            SET_CURSOR 8,0
            PRN_WHSP 80
            SET_CURSOR 9,0
            PRN_WHSP 80
            SET_CURSOR 10,0
            PRN_WHSP 80
            SET_CURSOR 11,0
            PRN_WHSP 80
            JMP INVALID_USERNAME_CHOICE_ERROR
        INVALID_PSW:
            PRNSTR NL_2
            PRNSTR_COLOR invalidPasswordMsg1,56,34H
            PRNSTR invalidPasswordMsg2
            INVALID_PSW_CHOICE_ERROR:
            SET_CURSOR 15,64
            MOV AH,02H
            MOV DL,20H
            INT 21H
            SET_CURSOR 15,64
            INPUT_BYTE CHOICE
            CMP CHOICE,31H
            JE SIGNUP
            CMP CHOICE,32H
            JE START
            PRN_WHSP 22
            PRNSTR_COLOR choiceErrorMsg,35,34H
            PRNSTR NL_1
            PRN_WHSP 26
            CALL PRESS_CONT
            SET_CURSOR 15,0
            PRN_WHSP 80
            SET_CURSOR 16,0
            PRN_WHSP 80
            SET_CURSOR 17,0
            PRN_WHSP 80
            SET_CURSOR 18,0
            PRN_WHSP 80
            JMP INVALID_PSW_CHOICE_ERROR

    LOGIN:
        CALL CLS
        CMP isSignedUp,1
        JNE NOT_SIGNED_UP
        PRNSTR loginAccMsg
        ; Get login username
        PRNSTR enterUsernameMsg
        ;---INPUT STRING:0AH
        MOV AH,0AH
        MOV DX, OFFSET lUsername
        INT 21H
        ; CHANGE CHR(13) BY '$'.
            MOV SI, OFFSET lUsername + 1 ; NUMBER OF CHARACTERS ENTERED.
            mov CL, [SI] ; MOVE LENGTH TO CL.
            mov CH, 0      ; CLEAR CH TO USE CX. 
            INC CX         ; TO REACH CHR(13).
            add si, cx     ; NOW SI POINTS TO CHR(13).
            MOV AL,'$'
            mov [ si ], al ; REPLACE CHR(13) BY '$'.
        ; Get login password
        PRNSTR enterPswMsg
        GET_PW_ARR loginPsw, 8

        ; Verify username (STRING COMPARISION)
        MOV BX,00
        MOV BL,username+1
        MOV BH,lUsername+1
        CMP BL,BH
        JNE WRONG_LOGIN
        LEA SI,username
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
        VERIFY_LOGIN_PSW:
            MOV AL,loginPsw[SI]
            CMP AL,psw[SI]
            JNE WRONG_LOGIN
            INC SI
            LOOP VERIFY_LOGIN_PSW        
        CORRECT_PSW:
            PRNSTR NL_2
            PRNSTR NL_1
            PRN_WHSP 20
            PRNSTR_COLOR correctPswMsg,39,3AH
            PRN_WHSP 25
            CALL PRESS_CONT
            CALL CLS
            JMP MAIN_MENU
        WRONG_LOGIN:
            PRNSTR NL_2
            PRNSTR NL_1
            PRNSTR_COLOR wrongLoginMsg1,58,34H
            PRNSTR wrongLoginMsg2
            WRONG_LOGIN_CHOICE_ERROR:
            SET_CURSOR 9,64
            MOV AH,02H
            MOV DL,20H
            INT 21H
            SET_CURSOR 9,64
            INPUT_BYTE CHOICE
            CMP CHOICE,31H
            JE LOGIN
            CMP CHOICE,32H
            JE Start
            PRN_WHSP 22
            PRNSTR_COLOR choiceErrorMsg,35,34H
            PRNSTR NL_1
            PRN_WHSP 26
            CALL PRESS_CONT
            SET_CURSOR 9,0
            PRN_WHSP 80
            SET_CURSOR 10,0
            PRN_WHSP 80
            SET_CURSOR 11,0
            PRN_WHSP 80
            SET_CURSOR 12,0
            PRN_WHSP 80
            JMP WRONG_LOGIN_CHOICE_ERROR
        
    NOT_SIGNED_UP:
        PRNSTR notSignedUpMsg
        PRNSTR NL_1
        PRN_WHSP 26
        CALL PRESS_CONT
        CALL CLS
        JMP START
    ;---------------------END OF SECTION#1-------------------------

    ;---------------------SECTION#2--------------------------------
    ;---------------------Main Menu--------------------------------
    MAIN_MENU:
        CALL CLS
        PRNSTR mainMenuMsg
        PRNSTR_OFFSET username
        PRNSTR mainMenuMsg2
        ;-----Get choice
        PRN_WHSP 24
        PRN_CHOICE_MSG 1,3
        INPUT_BYTE CHOICE
        ;-----Compare
        CMP CHOICE,31H
        JE FOOD_MENU
        CMP CHOICE,32H
        JE REVIEW_MENU
        CMP CHOICE,33H
        JE START
        PRN_WHSP 22
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 26
        CALL PRESS_CONT
        CALL CLS
        JMP MAIN_MENU
    ;---------------------END OF SECTION#2-------------------------

    ;---------------------SECTION#3#START--------------------------
    ;---------------------Food Menu--------------------------------
    FOOD_MENU:
        CALL CLS
 
        MOV CURR_ITEM_TYPE_IN_ORDER,0
        MOV SI,0
        CHK_ITEM_TYPE_IN_ORDER:
            CMP SI,ITEM_LENGTH_TIMES_TWO
            JE STOP_CHK_ITEM_TYPE_IN_ORDER
            
            MOV AX,[ITEM_TYPE_IN_ORDER+SI]
            CMP AX,1
            JE INC_ITO
            JNE NO_INC_ITO
            INC_ITO:
                MOV AX,CURR_ITEM_TYPE_IN_ORDER
                ADD AX,1
                MOV CURR_ITEM_TYPE_IN_ORDER,AX
            NO_INC_ITO:
            INC SI
            INC SI
            JMP CHK_ITEM_TYPE_IN_ORDER
        STOP_CHK_ITEM_TYPE_IN_ORDER:
        MOV AX,MAX_ITEM_TYPE_IN_ORDER
        CMP AX,CURR_ITEM_TYPE_IN_ORDER
        JE MAX_ITEM_TYPE_REACHED

        PRNSTR foodMenuMsg
        ;-----Get choice
        PRN_WHSP 25
        PRN_CHOICE_MSG 1,5
        INPUT_BYTE CHOICE
        ;-----Compare
        CMP CHOICE,31H
        JE ICE_CREAM_MENU
        CMP CHOICE,32H
        JE CAKE_MENU
        CMP CHOICE,33H
        JE DRINK_MENU
        CMP CHOICE,34H
        JE PURE_MENU
        CMP CHOICE,35H
        JE MAIN_MENU
        PRN_WHSP 25
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 25
        CALL PRESS_CONT
        JMP FOOD_MENU
    ;-----Max Item Type Reach
    MAX_ITEM_TYPE_REACHED:
        CALL CLS
        PRNSTR maxItemMsg
        MOV AH,0
        INT 16H
        JMP MAIN_MENU

    ;-----Ice Cream Menu
    ICE_CREAM_MENU:
        CALL CLS
        PRNSTR iceCreamMsg
        ;-----Get choice
        PRN_WHSP 24
        PRN_CHOICE_MSG 1,4
        INPUT_BYTE CHOICE
        ;-----Compare
        CMP CHOICE,"1"
        JE ICE_CREAM_BANANA_SELECTED
        CMP CHOICE,32H
        JE ICE_CREAM_VANILLA_SELECTED
        CMP CHOICE,33H
        JE ICE_CREAM_PEANUT_SELECTED
        CMP CHOICE,34H
        JE FOOD_MENU
        ;-----Choice Error
        PRN_WHSP 24
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 24
        CALL PRESS_CONT
        JMP ICE_CREAM_MENU
        ;-----Assign currItemIndex based on item selected
        ICE_CREAM_BANANA_SELECTED:
            MOV currItemIndex,0
            JMP ICE_CREAM_CONT
        ICE_CREAM_VANILLA_SELECTED:
            MOV currItemIndex,1
            JMP ICE_CREAM_CONT
        ICE_CREAM_PEANUT_SELECTED:
            MOV currItemIndex,2
            JMP ICE_CREAM_CONT
        ;-----Continue to Stock & Quantity
        ICE_CREAM_CONT:
            ;-----SI = currItemIndex * 2
            XOR AX,AX
            MOV AX,currItemIndex
            MOV CX,2
            MUL CX
            MOV SI,AX
            ;-----Print stock
            CALL PRINT_STOCK_PROC
            ;-----Get quantity
            HANDLE_CURRQUANTITY1_BKSP_IC:
            SET_CURSOR 16,53
            INPUT_BYTE currQuantity1
            ;-----Check currQuantity1 BACKSPACE
            CMP currQuantity1,08H
            JE HANDLE_CURRQUANTITY1_BKSP_IC
            ;-----Check currQuantity1 to be 1 to 9 only
            CHECK_CURRQUANTITY1:
                CMP currQuantity1,31H
                JAE CHECK_CURRQUANTITY1_2
                JB INVALID_CURRQTY1_ERROR
            CHECK_CURRQUANTITY1_2:
                CMP currQuantity1,39H
                JBE VALID_CURRQUANTITY1_IC
                JA INVALID_CURRQTY1_ERROR
            ; currQuantity1 is between 1 to 9
            VALID_CURRQUANTITY1_IC:
            ;-----Get currQuantity2
            SET_CURSOR 16,54
            INPUT_BYTE currQuantity2
            ;-----Check currQuantity2 BACKSPACE
            CMP currQuantity2,08H
            JE VALID_CURRQUANTITY1_IC
            ; If the currQuantity2 is a digit
            SUB AL,'0'
            CMP AL,'9' - '0'
            JBE DOUBLE_DIGIT_CURRQUANTITY
            ; If the currQuantity2 is ENTER
            ADD AL,'0'
            CMP AL,13
            JE SINGLE_DIGIT_CURRQUANTITY
            JNE INVALID_CURRQTY2_ERROR
            SINGLE_DIGIT_CURRQUANTITY:
                SUB currQuantity1,30H
                XOR AX,AX
                MOV AL,currQuantity1
                JMP CONT_CONF_IC
            DOUBLE_DIGIT_CURRQUANTITY:
                SUB currQuantity1,30H
                SUB currQuantity2,30H
                XOR AX,AX
                MOV AL,currQuantity1
                MUL ten
                ADD AL,currQuantity2
                JMP CONT_CONF_IC
            CONT_CONF_IC:
                ; Verify max
                MOV BX,[stockArr+SI]
                CMP AX,BX ; compare quantity with stock
                JG MAX_ERROR_IC
                MOV tempWORD,AX

                PRNSTR NL_2
                PRN_WHSP 10
                PRNSTR confirmContMsg
                INPUT_BYTE CHOICE
                ;-----Validate Yes (any other keys means NO)
                CMP CHOICE,59H ; Y
                JE IC_YES
                CMP CHOICE,79H ; y
                JE IC_YES
                JMP ICE_CREAM_MENU

                IC_YES:
                ; Assign the input quantity to the array
                MOV AX,tempWORD
                MOV [quantityArr+SI],AX
                JMP CUSTOMIZE_MENU
                
        MAX_ERROR_IC:
            CALL MAX_ERROR_PROC
            JMP ICE_CREAM_MENU
        INVALID_CURRQTY1_ERROR:
            PRNSTR NL_1
            PRN_WHSP 12
            PRNSTR_COLOR invalidQuantity1Msg,53,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP ICE_CREAM_MENU
        INVALID_CURRQTY2_ERROR:
            PRNSTR NL_1
            PRN_WHSP 5
            PRNSTR_COLOR invalidQuantity2Msg,70,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP ICE_CREAM_MENU
    ;-----Cake Menu
    CAKE_MENU:
        CALL CLS
        PRNSTR cakeMsg
        ;-----Get choice
        PRN_WHSP 24
        PRN_CHOICE_MSG 1,4
        INPUT_BYTE CHOICE
        ;-----Compare
        CMP CHOICE,"1"
        JE CAKE_CHEESE_SELECTED
        CMP CHOICE,"2"
        JE CAKE_GREEN_TEA_SELECTED
        CMP CHOICE,"3"
        JE CAKE_MOCHA_SELECTED
        CMP CHOICE,"4"
        JE FOOD_MENU
        ;-----Choice Error
        PRN_WHSP 24
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 24
        CALL PRESS_CONT
        JMP CAKE_MENU
        ;-----Assign currItemIndex based on item selected
        CAKE_CHEESE_SELECTED:
            MOV currItemIndex,3
            JMP CAKE_CONT
        CAKE_GREEN_TEA_SELECTED:
            MOV currItemIndex,4
            JMP CAKE_CONT
        CAKE_MOCHA_SELECTED:
            MOV currItemIndex,5
            JMP CAKE_CONT
        ;-----Continue to Stock & Quantity for CAKE
        CAKE_CONT:
            ;-----SI = currItemIndex * 2
            XOR AX,AX
            MOV AX,currItemIndex
            MOV CX,2
            MUL CX
            MOV SI,AX
            ;-----Print stock
            CALL PRINT_STOCK_PROC
            ;-----Get quantity
            HANDLE_CURRQUANTITY1_BKSP_CAKE:
            SET_CURSOR 16,53
            INPUT_BYTE currQuantity1
            ;-----Check currQuantity1 BACKSPACE
            CMP currQuantity1,08H
            JE HANDLE_CURRQUANTITY1_BKSP_CAKE
            ;-----Check currQuantity1 to be 1 to 9 only
            CHECK_CURRQUANTITY1_CAKE:
                CMP currQuantity1,31H
                JAE CHECK_CURRQUANTITY1_2_CAKE
                JB INVALID_CURRQTY1_ERROR_CAKE
            CHECK_CURRQUANTITY1_2_CAKE:
                CMP currQuantity1,39H
                JBE VALID_CURRQUANTITY1_CAKE
                JA INVALID_CURRQTY1_ERROR_CAKE
            ; currQuantity1 is between 1 to 9
            VALID_CURRQUANTITY1_CAKE:
            ;-----Get currQuantity2
            SET_CURSOR 16,54
            INPUT_BYTE currQuantity2
            ;-----Check currQuantity2 BACKSPACE
            CMP currQuantity2,08H
            JE VALID_CURRQUANTITY1_CAKE
            ; If the currQuantity2 is a digit
            SUB AL,'0'
            CMP AL,'9' - '0'
            JBE DOUBLE_DIGIT_CURRQUANTITY_CAKE
            ; If the currQuantity2 is ENTER
            ADD AL,'0'
            CMP AL,13
            JE SINGLE_DIGIT_CURRQUANTITY_CAKE
            JNE INVALID_CURRQTY2_ERROR_CAKE
            SINGLE_DIGIT_CURRQUANTITY_CAKE:
                SUB currQuantity1,30H
                XOR AX,AX
                MOV AL,currQuantity1
                JMP CONT_CONF_CAKE
            DOUBLE_DIGIT_CURRQUANTITY_CAKE:
                SUB currQuantity1,30H
                SUB currQuantity2,30H
                XOR AX,AX
                MOV AL,currQuantity1
                MUL ten
                ADD AL,currQuantity2
                JMP CONT_CONF_CAKE
            CONT_CONF_CAKE:
                ; Verify max
                MOV BX,[stockArr+SI]
                CMP AX,BX ; compare quantity with stock
                JG MAX_ERROR_CAKE
                MOV tempWORD,AX

                PRNSTR NL_2
                PRN_WHSP 10
                PRNSTR confirmContMsg
                INPUT_BYTE CHOICE
                ;-----Validate Yes (any other keys means NO)
                CMP CHOICE,59H ; Y
                JE CAKE_YES
                CMP CHOICE,79H ; y
                JE CAKE_YES
                JMP CAKE_MENU

                CAKE_YES:
                ; Assign the input quantity to the array
                MOV AX,tempWORD
                MOV [quantityArr+SI],AX
                JMP CUSTOMIZE_MENU
        MAX_ERROR_CAKE:
            CALL MAX_ERROR_PROC
            JMP CAKE_MENU
        INVALID_CURRQTY1_ERROR_CAKE:
            PRNSTR NL_1
            PRN_WHSP 12
            PRNSTR_COLOR invalidQuantity1Msg,53,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP CAKE_MENU
        INVALID_CURRQTY2_ERROR_CAKE:
            PRNSTR NL_1
            PRN_WHSP 5
            PRNSTR_COLOR invalidQuantity2Msg,70,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP CAKE_MENU
    ;-----Drink Menu
    DRINK_MENU:
        CALL CLS
        PRNSTR drinksMsg
        ;-----Get choice
        PRN_WHSP 24
        PRN_CHOICE_MSG 1,4
        INPUT_BYTE CHOICE
        ;-----Compare
        CMP CHOICE,"1"
        JE DRINK_AMERICANO_SELECTED
        CMP CHOICE,"2"
        JE DRINK_ESPRESSO_SELECTED
        CMP CHOICE,"3"
        JE DRINK_MACCHIATO_SELECTED
        CMP CHOICE,"4"
        JE FOOD_MENU
        ;-----Choice Error
        PRN_WHSP 24
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 24
        CALL PRESS_CONT
        JMP DRINK_MENU
        ;-----Assign currItemIndex based on item selected
        DRINK_AMERICANO_SELECTED:
            MOV currItemIndex,6
            JMP DRINK_CONT
        DRINK_ESPRESSO_SELECTED:
            MOV currItemIndex,7
            JMP DRINK_CONT
        DRINK_MACCHIATO_SELECTED:
            MOV currItemIndex,8
            JMP DRINK_CONT
        ;-----Continue to Stock & Quantity for CAKE
        DRINK_CONT:
            ;-----SI = currItemIndex * 2
            XOR AX,AX
            MOV AX,currItemIndex
            MOV CX,2
            MUL CX
            MOV SI,AX
            ;-----Print stock
            CALL PRINT_STOCK_PROC
            ;-----Get quantity
            HANDLE_CURRQUANTITY1_BKSP_DRINK:
            SET_CURSOR 16,53
            INPUT_BYTE currQuantity1
            ;-----Check currQuantity1 BACKSPACE
            CMP currQuantity1,08H
            JE HANDLE_CURRQUANTITY1_BKSP_DRINK
            ;-----Check currQuantity1 to be 1 to 9 only
            CHECK_CURRQUANTITY1_DRINK:
                CMP currQuantity1,31H
                JAE CHECK_CURRQUANTITY1_2_DRINK
                JB INVALID_CURRQTY1_ERROR_DRINK
            CHECK_CURRQUANTITY1_2_DRINK:
                CMP currQuantity1,39H
                JBE VALID_CURRQUANTITY1_DRINK
                JA INVALID_CURRQTY1_ERROR_DRINK
            ; currQuantity1 is between 1 to 9
            VALID_CURRQUANTITY1_DRINK:
            ;-----Get currQuantity2
            SET_CURSOR 16,54
            INPUT_BYTE currQuantity2
            ;-----Check currQuantity2 BACKSPACE
            CMP currQuantity2,08H
            JE VALID_CURRQUANTITY1_DRINK
            ; If the currQuantity2 is a digit
            SUB AL,'0'
            CMP AL,'9' - '0'
            JBE DOUBLE_DIGIT_CURRQUANTITY_DRINK
            ; If the currQuantity2 is ENTER
            ADD AL,'0'
            CMP AL,13
            JE SINGLE_DIGIT_CURRQUANTITY_DRINK
            JNE INVALID_CURRQTY2_ERROR_DRINK
            SINGLE_DIGIT_CURRQUANTITY_DRINK:
                SUB currQuantity1,30H
                XOR AX,AX
                MOV AL,currQuantity1
                JMP CONT_CONF_DRINK
            DOUBLE_DIGIT_CURRQUANTITY_DRINK:
                SUB currQuantity1,30H
                SUB currQuantity2,30H
                XOR AX,AX
                MOV AL,currQuantity1
                MUL ten
                ADD AL,currQuantity2
                JMP CONT_CONF_DRINK
            CONT_CONF_DRINK:
                ; Verify max
                MOV BX,[stockArr+SI]
                CMP AX,BX ; compare quantity with stock
                JG MAX_ERROR_DRINK
                MOV tempWORD,AX

                PRNSTR NL_2
                PRN_WHSP 10
                PRNSTR confirmContMsg
                INPUT_BYTE CHOICE
                ;-----Validate Yes (any other keys means NO)
                CMP CHOICE,59H ; Y
                JE DRINK_YES
                CMP CHOICE,79H ; y
                JE DRINK_YES
                JMP DRINK_MENU

                DRINK_YES:
                ; Assign the input quantity to the array
                MOV AX,tempWORD
                MOV [quantityArr+SI],AX
                JMP CUSTOMIZE_MENU
        MAX_ERROR_DRINK:
            CALL MAX_ERROR_PROC
            JMP DRINK_MENU
        INVALID_CURRQTY1_ERROR_DRINK:
            PRNSTR NL_1
            PRN_WHSP 12
            PRNSTR_COLOR invalidQuantity1Msg,53,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP DRINK_MENU
        INVALID_CURRQTY2_ERROR_DRINK:
            PRNSTR NL_1
            PRN_WHSP 5
            PRNSTR_COLOR invalidQuantity2Msg,70,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP DRINK_MENU
    ;-----Pure Menu
    PURE_MENU:
        CALL CLS
        ;-----Assign 9 as currItemIndex for Pure Oreo Cookies
        MOV currItemIndex,9
        ;-----Continue to Stock & Quantity for Pure Oreo Cookies
            ;-----SI = currItemIndex * 2
            XOR AX,AX
            MOV AX,currItemIndex
            MOV CX,2
            MUL CX
            MOV SI,AX
            ;-----Print stock
            CALL PRINT_STOCK_PROC
            ;-----Get quantity
            HANDLE_CURRQUANTITY1_BKSP_PURE:
            SET_CURSOR 3,53
            INPUT_BYTE currQuantity1
            ;-----Check currQuantity1 BACKSPACE
            CMP currQuantity1,08H
            JE HANDLE_CURRQUANTITY1_BKSP_PURE
            ;-----Check currQuantity1 to be 1 to 9 only
            CHECK_CURRQUANTITY1_PURE:
                CMP currQuantity1,31H
                JAE CHECK_CURRQUANTITY1_2_PURE
                JB INVALID_CURRQTY1_ERROR_PURE
            CHECK_CURRQUANTITY1_2_PURE:
                CMP currQuantity1,39H
                JBE VALID_CURRQUANTITY1_PURE
                JA INVALID_CURRQTY1_ERROR_PURE
            ; currQuantity1 is between 1 to 9
            VALID_CURRQUANTITY1_PURE:
            ;-----Get currQuantity2
            SET_CURSOR 3,54
            INPUT_BYTE currQuantity2
            ;-----Check currQuantity2 BACKSPACE
            CMP currQuantity2,08H
            JE VALID_CURRQUANTITY1_PURE
            ; If the currQuantity2 is a digit
            SUB AL,'0'
            CMP AL,'9' - '0'
            JBE DOUBLE_DIGIT_CURRQUANTITY_PURE
            ; If the currQuantity2 is ENTER
            ADD AL,'0'
            CMP AL,13
            JE SINGLE_DIGIT_CURRQUANTITY_PURE
            JNE INVALID_CURRQTY2_ERROR_PURE
            SINGLE_DIGIT_CURRQUANTITY_PURE:
                SUB currQuantity1,30H
                XOR AX,AX
                MOV AL,currQuantity1
                JMP CONT_CONF_PURE
            DOUBLE_DIGIT_CURRQUANTITY_PURE:
                SUB currQuantity1,30H
                SUB currQuantity2,30H
                XOR AX,AX
                MOV AL,currQuantity1
                MUL ten
                ADD AL,currQuantity2
                JMP CONT_CONF_PURE
            CONT_CONF_PURE:
                ; Verify max
                MOV BX,[stockArr+SI]
                CMP AX,BX ; compare quantity with stock
                JG MAX_ERROR_PURE
                MOV tempWORD,AX

                PRNSTR NL_2
                PRN_WHSP 10
                PRNSTR confirmContMsg
                INPUT_BYTE CHOICE
                ;-----Validate Yes (any other keys means NO)
                CMP CHOICE,59H ; Y
                JE PURE_YES
                CMP CHOICE,79H ; y
                JE PURE_YES
                JMP PURE_MENU

                PURE_YES:
                ; Assign the input quantity to the array
                MOV AX,tempWORD
                MOV [quantityArr+SI],AX
                JMP CUSTOMIZE_MENU
        MAX_ERROR_PURE:
            CALL MAX_ERROR_PROC
            JMP PURE_MENU
        INVALID_CURRQTY1_ERROR_PURE:
            PRNSTR NL_1
            PRN_WHSP 12
            PRNSTR_COLOR invalidQuantity1Msg,53,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP PURE_MENU
        INVALID_CURRQTY2_ERROR_PURE:
            PRNSTR NL_1
            PRN_WHSP 5
            PRNSTR_COLOR invalidQuantity2Msg,70,34H
            PRN_WHSP 24
            PRNSTR contMsg
            MOV AH,0
            INT 16H
            JMP PURE_MENU
    ;---------------------END OF SECTION#3-------------------------

    ;---------------------SECTION#4#START--------------------------
    ;---------------------Customize Menu---------------------------
    CUSTOMIZE_MENU:
        CALL CLS
        PRNSTR cusMenuMsg
        OUTPUT_NUM [quantityArr+SI]
        OUTPUT_BYTE " "
        PRN_CURR_ITEM_NAME currItemIndex
        PRNSTR cusMenuMsg2
        ;-----Get flavour choice
        PRNSTR enterFlavourMsg
        INPUT_BYTE currItemFlavour
        ;-----Validate flavour choice
        SUB AL,'1'
        CMP AL,'4' - '1'
        JBE VALID_FLAVOUR_CHOICE
        PRN_WHSP 14
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 14
        CALL PRESS_CONT
        JMP CUSTOMIZE_MENU

        VALID_FLAVOUR_CHOICE:
            MOV AH,0
            MOV AL,currItemFlavour
            SUB AL,30H
            MOV currItemFlavour,AL
            MOV CX,10
            MUL CX
            MOV currItemFlaVarTracker,AX
            
        ;-----Get variety choice
        PRNSTR enterVarietyMsg
        INPUT_BYTE currItemVariety
        ;-----Validate flavour choice
        SUB AL,'5'
        CMP AL,'7' - '5'
        JBE VALID_VARIETY_CHOICE
        PRN_WHSP 14
        PRNSTR_COLOR choiceErrorMsg,35,34H
        PRN_WHSP 14
        CALL PRESS_CONT
        JMP CUSTOMIZE_MENU

        VALID_VARIETY_CHOICE:
            ;-----Confirm Flavour/Variety choice
            MOV AH,0
            MOV AL,currItemVariety
            SUB AL,30H
            MOV currItemVariety,AL
            ADD currItemFlaVarTracker,AX
            
            PRNSTR cusConfirmMsg1
            PRNSTR cusFlaMsg
            PRN_OREO_CHOICE currItemFlavour

            PRNSTR cusVarMsg
            PRN_OREO_CHOICE currItemVariety
            PRNSTR cusConfirmMsg2
            INPUT_BYTE CHOICE
            ;-----Validate Yes (any other keys means NO)
            CMP CHOICE,59H ; Y
            JE CUST_YES
            CMP CHOICE,79H ; y
            JE CUST_YES
            JMP CUSTOMIZE_MENU

            CUST_YES:                
        ;-----Assign currItemFlaVarTracker to flaVarTracker
        MOV BX,currItemFlaVarTracker
        MOV [flaVarTracker+SI],BX

    ORDER_PRICE_REVIEW:
        CALL CLS
        PRNSTR orderPriceReviewMsg1
        ;-----Display item name
        PRNSTR orderPriceReviewItemMsg
        PRN_CURR_ITEM_NAME currItemIndex

        ;-----Display unit price
        PRNSTR orderPriceReviewUnitPriceMsg
        OUTPUT_FLOAT [unitPriceIntArr+SI],[unitPriceManArr+SI]

        ;-----Display flavour price
        XOR AX,AX
        MOV AL,currItemFlavour
        SUB AL,1
        MOV CX,2
        MUL CX
        MOV SI,AX
        PRNSTR orderPriceReviewFlavourMsg
        MOV BX,[flavourPriceIntArr+SI]
        MOV currFlavourPriceInt,BX
        MOV BX,[flavourPriceManArr+SI]
        MOV currFlavourPriceMan,BX
        OUTPUT_FLOAT currFlavourPriceInt,currFlavourPriceMan

        ;-----Display variety price
        XOR AX,AX
        MOV AL,currItemVariety
        SUB AL,5
        MOV CX,2
        MUL CX
        MOV SI,AX
        PRNSTR orderPriceReviewVarietyMsg
        MOV BX,[varietyPriceIntArr+SI]
        MOV currVarietyPriceInt,BX
        MOV BX,[varietyPriceManArr+SI]
        MOV currVarietyPriceMan,BX
        OUTPUT_FLOAT currVarietyPriceInt,currVarietyPriceMan

        ;-----Display quantity
        PRNSTR orderPriceReviewQuantityMsg
            ;-----SI = currItemIndex * 2
            XOR AX,AX
            MOV AX,currItemIndex
            MOV CX,2
            MUL CX
            MOV SI,AX
        OUTPUT_NUM [quantityArr+SI]

        ;-----Calculate order price
            ;-----Add with flavour price
        ADDITION_FLT [unitPriceIntArr+SI],[unitPriceManArr+SI],currFlavourPriceInt,currFlavourPriceMan,currOrderPriceInt,currOrderPriceMan
            ;-----Add with variety price
        ADDITION_FLT currOrderPriceInt,currOrderPriceMan,currVarietyPriceInt,currVarietyPriceMan,currOrderPriceInt,currOrderPriceMan
            ;-----Times with quantity
        MULTIPLICATION_FLT currOrderPriceInt,currOrderPriceMan,[quantityArr+SI],currOrderPriceInt,currOrderPriceMan

        ;-----Display order price
        PRNSTR orderPriceReviewOrderPriceMsg
        OUTPUT_FLOAT currOrderPriceInt,currOrderPriceMan

        ;-----Assign current order price to orderPriceArr
        MOV BX,currOrderPriceInt
        MOV [orderPriceIntArr+SI],BX
        MOV BX,currOrderPriceMan
        MOV [orderPriceManArr+SI],BX

        ;-----Order Recorded
        MOV hasOrder,1
        PRNSTR NL_1
        PRN_WHSP 14
        PRNSTR_COLOR orderRecordedSuccessMsg,45,3AH
        ;-----Assign 1 to ITEM_TYPE_IN_ORDER's respective item
        MOV [ITEM_TYPE_IN_ORDER+SI],1
        ;-----Navigate
        PRNSTR afterOrderRecordMsg
        INPUT_BYTE CHOICE
        CMP CHOICE,31H
        JE MAIN_MENU
        CMP CHOICE,32H
        JE REVIEW_MENU
        CMP CHOICE,33H
        JE FOOD_MENU
        PRNSTR NL_1
        PRN_WHSP 19
        PRNSTR_COLOR selectionErrorMsg,39,34H
        PRN_WHSP 25
        CALL PRESS_CONT
        JMP ORDER_PRICE_REVIEW
    ;---------------------END OF SECTION#4-------------------------

    ;---------------------SECTION#5#START--------------------------
    ;---------------------Review Menu------------------------------
    REVIEW_MENU:
        CALL CLS
        CMP hasOrder,0
        JE NO_ORDER
        PRNSTR reviewMenuMsg

        ;-----Display each row of items
        MOV SI,0      ; SI = 0,2,4,[6]
        MOV counter,0 ; counter = 0,1,2
        MOV temp,7
        PRINT_ITEMS:
            CMP SI,ITEM_LENGTH_TIMES_TWO
            JE STOP_PRINTING_ITEMS

            ; If quantity != 0, then the item is ordered
            MOV BX,[quantityArr+SI]
            CMP BX,0
            JE SKIP_PRINT_ITEM
            JNE CONT_PRINT_ITEM

            SKIP_PRINT_ITEM:
                MOV BL,counter
                ADD BL,1
                MOV counter,BL
                INC SI
                INC SI
                JMP PRINT_ITEMS
            
            CONT_PRINT_ITEM:
                ;-----Output item name
                SET_CURSOR temp,9

                PRN_CURR_ITEM_NAME counter

                ;-----Output oreo flavour
                SET_CURSOR temp,35
                ; Extract the flavour code (the quotient/AL)
                MOV AX,0
                MOV AX,[flaVarTracker+SI]
                DIV ten
                PRN_OREO_CHOICE AL
                
                ;-----Output quantity
                SET_CURSOR temp,50

                OUTPUT_NUM [quantityArr+SI]

                ;-----Output order price
                SET_CURSOR temp,61

                OUTPUT_FLOAT [orderPriceIntArr+SI],[orderPriceManArr+SI]

                OUTPUT_BYTE 13
                OUTPUT_BYTE 10

                ;-----Output oreo variety on the next row
                MOV AL,temp
                ADD AL,1
                MOV temp,AL

                SET_CURSOR temp,35
                ; Extract the variety code (the remainder/AH)
                MOV AX,0
                MOV AX,[flaVarTracker+SI]
                DIV ten
                PRN_OREO_CHOICE AH

                ; Increase row by 1 again for the next item
                MOV AL,temp
                ADD AL,1
                MOV temp,AL
                MOV BL,counter
                ADD BL,1
                MOV counter,BL
                INC SI
                INC SI
                JMP PRINT_ITEMS
        
        STOP_PRINTING_ITEMS:
            PRNSTR reviewTotalMsg
            ;-----Calculate and Output Total Price Excl SST
                ; IMPORTANT: Reset totalPriceExclSST = 0
                MOV totalPriceExclSST_INT,0
                MOV totalPriceExclSST_MAN,0

            MOV SI,0
            CALCULATE_TOTAL_PRICE_EXCL_SST:
                CMP SI,ITEM_LENGTH_TIMES_TWO
                JE OUTPUT_TOTAL_PRICE_EXCL_SST
                ; totalPriceExclSST += orderPrice
                ADDITION_FLT [orderPriceIntArr+SI],[orderPriceManArr+SI],totalPriceExclSST_INT,totalPriceExclSST_MAN,totalPriceExclSST_INT,totalPriceExclSST_MAN
                INC SI
                INC SI
                JMP CALCULATE_TOTAL_PRICE_EXCL_SST
            OUTPUT_TOTAL_PRICE_EXCL_SST:
                PUSH CX
                MOV AH,3    ; Get the current cursor position
                MOV BH,0
                INT 10H
                MOV AH,2    ; Set cursor position
                MOV BH,0
                MOV DL,61
                INT 10H
                POP CX

                OUTPUT_FLOAT totalPriceExclSST_INT,totalPriceExclSST_MAN

            PRNSTR reviewEndMsg
            ;-----Get choice
            PRN_WHSP 16
            PRN_CHOICE_MSG 1,2
            INPUT_BYTE CHOICE
            ;-----Compare
            CMP CHOICE,31H
            JE RECEIPT_MENU
            CMP CHOICE,32H
            JE MAIN_MENU
            PRNSTR NL_1
            PRN_WHSP 16
            PRNSTR_COLOR choiceErrorMsg,54,34H
            PRN_WHSP 16
            CALL PRESS_CONT
            CALL CLS
            JMP REVIEW_MENU
    
    NO_ORDER:
        PRNSTR hasNoOrderMsg
        MOV AH,0
        INT 16H
        JMP MAIN_MENU
    ;---------------------END OF SECTION#5-------------------------

    ;---------------------SECTION#6#START--------------------------
    ;---------------------Receipt Menu-----------------------------
    RECEIPT_MENU:
        CALL CLS
        ;-----Get voucher choice Yes or No
        PRNSTR receiptMenuMsg
        INPUT_BYTE CHOICE
        ;-----Validate Yes or No (Y/y/N/n)
        CMP CHOICE,59H ; Y
        JE VOUCHER_YES
        CMP CHOICE,79H ; y
        JE VOUCHER_YES
        CMP CHOICE,4EH ; N
        JE VOUCHER_NO
        CMP CHOICE,6EH ; n
        JE VOUCHER_NO
        PRN_WHSP 18
        PRNSTR_COLOR selectionErrorMsg,39,34H
        PRN_WHSP 19
        CALL PRESS_CONT
        JMP RECEIPT_MENU

        VOUCHER_YES:
            PRNSTR enterVoucherMsg

            ;---INPUT UCODE/user input voucher code
            MOV AH,0AH
            MOV DX,OFFSET ucode
            INT 21H
            ; CHANGE CHR(13) BY '$'.
                MOV SI,OFFSET ucode + 1
                MOV CL,[SI] ; MOVE LENGTH TO CL.
                MOV CH,0    ; CLEAR CH TO USE CX. 
                INC CX      ; TO REACH CHR(13).
                ADD SI,CX   ; NOW SI POINTS TO CHR(13).
                MOV AL,'$'
                MOV [SI],AL ; REPLACE CHR(13) BY '$'.
            ; Check if ucode is valid (STRING COMPARISION)
            CHECK_VCODE1:
                MOV BX,00
                MOV BL,ucode+1
                MOV BH,5
                CMP BL,BH
                JNE CHECK_VCODE2

                LEA DI,ucode
                ADD DI,2
                MOV SI,0
                CHECK_VCODE1_LOOP:
                    MOV BL,vcode1[SI]
                    CMP BYTE PTR[DI],BL
                    JNE CHECK_VCODE2
                    INC SI
                    INC DI
                    CMP BYTE PTR[DI],"$"
                    JNE CHECK_VCODE1_LOOP
                MOV PERCENTAGE,5 ; 5% discount
                JMP VALID_CODE
            CHECK_VCODE2:
                MOV BX,00
                MOV BL,ucode+1
                MOV BH,4
                CMP BL,BH
                JNE CHECK_VCODE3

                LEA DI,ucode
                ADD DI,2
                MOV SI,0
                CHECK_VCODE2_LOOP:
                    MOV BL,vcode2[SI]
                    CMP BYTE PTR[DI],BL
                    JNE CHECK_VCODE3
                    INC SI
                    INC DI
                    CMP BYTE PTR[DI],"$"
                    JNE CHECK_VCODE2_LOOP
                MOV PERCENTAGE,4 ; 4% discount
                JMP VALID_CODE
            CHECK_VCODE3:
                MOV BX,00
                MOV BL,ucode+1
                MOV BH,8
                CMP BL,BH
                JNE INVALID_CODE

                LEA DI,ucode
                ADD DI,2
                MOV SI,0
                CHECK_VCODE3_LOOP:
                    MOV BL,vcode3[SI]
                    CMP BYTE PTR[DI],BL
                    JNE INVALID_CODE
                    INC SI
                    INC DI
                    CMP BYTE PTR[DI],"$"
                    JNE CHECK_VCODE3_LOOP
                MOV PERCENTAGE,3 ; 3% discount
                JMP VALID_CODE

            VALID_CODE:
                PRNSTR NL_2
                PRNSTR_COLOR voucherAppliedMsg,48,3AH
                JMP PRINT_RECEIPT_WITH_VOUCHER
            INVALID_CODE:
                PRNSTR NL_2
                PRNSTR_COLOR invalidVoucherMsg,35,34H
                PRN_WHSP 19
                CALL PRESS_CONT
                JMP RECEIPT_MENU

        VOUCHER_NO:
            JMP PRINT_RECEIPT_WITHOUT_VOUCHER

        PRINT_RECEIPT_WITH_VOUCHER:
            PRNSTR totalExclSSTMsg
            OUTPUT_FLOAT totalPriceExclSST_INT,totalPriceExclSST_MAN
            ; Copy totalPriceExclSST to discountedPrice for discount calculation
            MOV BX,totalPriceExclSST_INT
            MOV discountedPrice_INT,BX
            MOV BX,totalPriceExclSST_MAN
            MOV discountedPrice_MAN,BX
            ; Calculate and display discount amount
            ; discount = totalPriceExclSST - discountedPrice
            AFTER_DISCOUNT PERCENTAGE,discountedPrice_INT,discountedPrice_MAN            
            SUBTRACTION_FLT totalPriceExclSST_INT,totalPriceExclSST_MAN,discountedPrice_INT,discountedPrice_MAN,discount_INT,discount_MAN

            PRNSTR voucherDiscountMsg1
            OUTPUT_NUM PERCENTAGE
            PRNSTR voucherDiscountMsg2
            OUTPUT_FLOAT discount_INT,discount_MAN

            ; Display discountedPrice
            PRNSTR afterDiscountMsg
            OUTPUT_FLOAT discountedPrice_INT,discountedPrice_MAN
            ; Copy discountedPrice to totalPriceInclSST for remaining SST calculation
            MOV BX,discountedPrice_INT
            MOV totalPriceInclSST_INT,BX
            MOV BX,discountedPrice_MAN
            MOV totalPriceInclSST_MAN,BX
            ; totalPriceInclSST *= 1.06 (Mutated)
            MOV PERCENTAGE,6
            AFTER_TAX PERCENTAGE,totalPriceInclSST_INT,totalPriceInclSST_MAN

            ; Calculate & Display SST Charge
            ; SST Charge = Incl SST - discountedPrice
            SUBTRACTION_FLT totalPriceInclSST_INT,totalPriceInclSST_MAN,discountedPrice_INT,discountedPrice_MAN,SSTCharge_INT,SSTCharge_MAN
            PRNSTR SSTChargeMsg
            OUTPUT_FLOAT SSTCharge_INT,SSTCharge_MAN

            JMP PRINT_RECEIPT_REMAINING
        PRINT_RECEIPT_WITHOUT_VOUCHER:
            PRNSTR totalExclSSTMsg
            OUTPUT_FLOAT totalPriceExclSST_INT,totalPriceExclSST_MAN
            ; Copy totalPriceExclSST to totalPriceInclSST for remaining SST calculation
            MOV BX,totalPriceExclSST_INT
            MOV totalPriceInclSST_INT,BX
            MOV BX,totalPriceExclSST_MAN
            MOV totalPriceInclSST_MAN,BX
            ; totalPriceInclSST *= 1.06 (Mutated)
            MOV PERCENTAGE,6
            AFTER_TAX PERCENTAGE,totalPriceInclSST_INT,totalPriceInclSST_MAN

            ; Calculate & Display SST Charge
            ; SST Charge = Incl SST - Excl SST
            SUBTRACTION_FLT totalPriceInclSST_INT,totalPriceInclSST_MAN,totalPriceExclSST_INT,totalPriceExclSST_MAN,SSTCharge_INT,SSTCharge_MAN
            PRNSTR SSTChargeMsg
            OUTPUT_FLOAT SSTCharge_INT,SSTCharge_MAN

            JMP PRINT_RECEIPT_REMAINING

        ;-----Print Receipt
        PRINT_RECEIPT_REMAINING:
            ; Display Total Incl SST
            PRNSTR totalInclSSTMsg
            OUTPUT_FLOAT totalPriceInclSST_INT,totalPriceInclSST_MAN

            ; Calculate round off
            ; Copy totalPriceInclSST to finalTotal
            MOV BX,totalPriceInclSST_INT
            MOV finalTotal_INT,BX
            MOV BX,totalPriceInclSST_MAN
            MOV finalTotal_MAN,BX

            PRNSTR roundingAdjMsg
            ROUNDOFF finalTotal_INT,finalTotal_MAN

            MOV AX,totalPriceInclSST_INT
            CMP AX,finalTotal_INT
            JE CHK_MANTISSA
            JA INCL_SST_HIGHER
            JB INCL_SST_LOWER

            CHK_MANTISSA:
                MOV AX,totalPriceInclSST_MAN
                CMP AX,finalTotal_MAN
                JAE INCL_SST_HIGHER
                JB INCL_SST_LOWER

            INCL_SST_LOWER:
                SUBTRACTION_FLT finalTotal_INT,finalTotal_MAN,totalPriceInclSST_INT,totalPriceInclSST_MAN,rounding_INT,rounding_MAN
                JMP CONT_OUTPUT_ROUNDING_AND_TOTAL

            INCL_SST_HIGHER:
                SUBTRACTION_FLT totalPriceInclSST_INT,totalPriceInclSST_MAN,finalTotal_INT,finalTotal_MAN,rounding_INT,rounding_MAN
                JMP CONT_OUTPUT_ROUNDING_AND_TOTAL

            CONT_OUTPUT_ROUNDING_AND_TOTAL:
            OUTPUT_FLOAT rounding_INT,rounding_MAN
            PRNSTR totalMsg
            OUTPUT_FLOAT finalTotal_INT,finalTotal_MAN

        PRN_WHSP 19
        CALL PRESS_CONT
        JMP CHOOSE_PM_MENU
    ;---------------------END OF SECTION#6-------------------------

    ;---------------------SECTION#7#START--------------------------
    ;---------------------Payment Method Menu----------------------
    CHOOSE_PM_MENU:
        CALL CLS
        PRNSTR choosePmMsg
        INPUT_BYTE CHOICE
        ;-----Validate 1 or 2
        CMP CHOICE,31H ; Cash
        JE PAY_CASH
        CMP CHOICE,32H ; Credit card
        JE PAY_CARD
        CMP CHOICE,33H ; Go back
        JE REVIEW_MENU
        PRN_WHSP 18
        PRNSTR_COLOR selectionErrorMsg,39,34H
        PRN_WHSP 19
        CALL PRESS_CONT
        JMP CHOOSE_PM_MENU
    ;---------------------END OF SECTION#7-------------------------

    ;---------------------SECTION#8#START--------------------------
    ;---------------------Pay with Cash----------------------------
    PAY_CASH:
        CALL CLS
        PRNSTR cashPayMsg
        OUTPUT_FLOAT finalTotal_INT,finalTotal_MAN
        PRNSTR enterCashMsg
        GET_FLOAT_INPUT payAmount_INT,payAmount_MAN
        PRNSTR NL_2

        MOV AX,payAmount_INT  
        CMP AX,finalTotal_INT
        JB INSUFFICIENT_ERROR
        JA PAYMENT_SUCCESS
        MOV AX,payAmount_MAN
        CMP AX,finalTotal_MAN
        JB INSUFFICIENT_ERROR
        JMP PAYMENT_SUCCESS
        INSUFFICIENT_ERROR:
            PRNSTR NL_1
            PRNSTR_COLOR insufficientMsg,64,34H
            MOV AH,0
            INT 16H
            JMP PAY_CASH
        PAYMENT_SUCCESS:
            PRNSTR paymentSuccess
            PRNSTR NL_2
            SUBTRACTION_FLT payAmount_INT,payAmount_MAN,finalTotal_INT,finalTotal_MAN,payChange_INT,payChange_MAN
            PRN_WHSP 20
            PRNSTR_COLOR payChangeMsg,32,3AH
            OUTPUT_FLOAT payChange_INT,payChange_MAN
            PRNSTR NL_1
            PRNSTR NL_2
            PRN_WHSP 20
            CALL PRESS_CONT
            JMP DINE_METHOD_and_REF_CODE
    ;---------------------END OF SECTION#8-------------------------

    ;---------------------SECTION#9#START--------------------------
    ;---------------------Pay with Card----------------------------
    PAY_CARD:
        CALL CLS
        PRNSTR cardPayMsg
        OUTPUT_FLOAT finalTotal_INT,finalTotal_MAN
        PRNSTR enterCardMsg
        ;-----Get Credit Card Number
        MOV CX,16
        MOV SI,0
        GET_CARD_NUM_LOOP:
            MOV AH,07H
            INT 21H
            MOV DL,AL
            CMP AL,08H
            JE Card_DelNo
            MOV AH,02H
            INT 21H
            ;-----Validate isDigit
            CHECK_CARD_NUM_DIGIT1:
                CMP AL,30H
                JAE CHECK_CARD_NUM_DIGIT2
                JB INVALID_CARD_NUM_DIGIT
            CHECK_CARD_NUM_DIGIT2:
                CMP AL,39H
                JBE VALID_CARD_NUM_DIGIT
                JA INVALID_CARD_NUM_DIGIT    
            INVALID_CARD_NUM_DIGIT:
                PRNSTR NL_2
                PRNSTR_COLOR invalidCardNumDigitMsg,71,34H
                MOV AH,0
                INT 16H
                JMP PAY_CARD
            VALID_CARD_NUM_DIGIT:
                SUB AL,30H
                MOV cardNumber[SI],AL
                INC SI
                LOOP GET_CARD_NUM_LOOP
                JMP CARD_CONTINUE
            Card_DelNo:
                ; Reverse Input
                PUSH CX 
                CMP SI,0
                JE Card_DelNull
                POP CX
                INC CX
                PUSH CX
                DEC SI
                MOV cardNumber[SI],0
                ; Get Cursor
                XOR DX,DX
                XOR CX,CX
                MOV AH,03H
                INT 10H
                ; Set minus one cursor position
                DEC DL
                MOV AH,02H
                INT 10H
                PUSH DX
                ; Print Space
                MOV AH,02H
                MOV DL,20H
                INT 21H
                ; Set Back Cursor Position
                POP DX
                MOV AH,02H
                INT 10H
                Card_DelNull:
                POP CX 
                JMP GET_CARD_NUM_LOOP
        ;-----VALID:   4263982640269299
        ;-----INVALID: 4388576018402626
        ;-----Luhn Algorithm / Credit Card Number Validation
        ;-----Step 1:  
        ;     Double every second digit from right to left. 
        ;     If doubling of a digit results in a two-digit number,
        ;     add up the two digits to get a single-digit number.
        ;     Add all single-digit numbers.
        ;     ### 9+9+4+8+4+9+3+8=54
        CARD_CONTINUE:
        MOV cardSum,0
        MOV SI,0
        STEP1:
            MOV BL,cardNumber[SI]
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
                MOV BL,cardNumber[SI]
                ADD cardSum,BL
                INC SI
                INC SI
                LOOP STEP2_LOOP

        ;-----Step 3:
        ;     If the result from Step 2 is divisible by 10, 
        ;     the card number is valid; 
        ;     otherwise, it is invalid. 
        ;     ### 90 % 10 = 0
        ;     ### 90 / 10 = R(0), Q(9)

        MOV AX,0
        MOV AL,cardSum
        DIV ten
        CMP AH,0
        JE VALID_CARD
        JNE INVALID_CARD

        VALID_CARD:
            PRNSTR NL_2
            PRNSTR paymentSuccess
            PRNSTR NL_2
            PRNSTR NL_1
            PRNSTR_COLOR successPaymentMsg,68,3AH
            PRNSTR NL_1
            PRNSTR NL_2
            PRN_WHSP 20
            CALL PRESS_CONT
            JMP DINE_METHOD_and_REF_CODE

        INVALID_CARD:
            PRNSTR NL_2
            PRNSTR_COLOR invalidCardMsg,54,34H
            PRNSTR NL_1
            PRN_WHSP 20
            CALL PRESS_CONT
            JMP PAY_CARD
    ;---------------------END OF SECTION#9-------------------------

    ;---------------------SECTION#10#START-------------------------
    ;---------------------Dine Method and Ref Code-----------------
    DINE_METHOD_and_REF_CODE:
        CALL CLS
        PRNSTR dineOutEatInMsg
        ;-----Get choice
            INPUT_BYTE CHOICE
            ;-----Compare
            CMP CHOICE,"1"
            JNE CHK_EAT_IN
            PRNSTR_COLOR dineOutMsg,11,3AH
            JMP GENERATE_RAN_REF
            CHK_EAT_IN:
            CMP CHOICE,'2'
            JNE DINE_CHOICE_ERROR
            PRNSTR_COLOR eatInMsg,9,3AH
            JMP GENERATE_RAN_REF
            ;-----Choice Error
            DINE_CHOICE_ERROR:
                PRNSTR NL_1
                PRN_WHSP 20
                PRNSTR_COLOR selectionErrorMsg,39,34H
                PRNSTR NL_1
                PRN_WHSP 25
                CALL PRESS_CONT
                JMP DINE_METHOD_and_REF_CODE
        GENERATE_RAN_REF:
        PRNSTR NL_2
         ;---GENERATE REF CODE---
                ;---Get System Time || INT 21H - AH = 2CH
                MOV AH, 2CH
                INT 21H

                MOV RanRefCode1,CX; CX > CH = hour CL = minute (MAX = CH 23D CL 59D = CX 173B = 5947D)
                MOV RanRefCode2,DX; DX > DH = second; DL = centisecond (1/100 seconds)
                ; Note: on most systems, the resolution of the system clock 
                ; is about 5/100sec, so returned times generally 
                ; do not increment by 1 on some systems, 
                ; DL may always return 00h
                
                ;--------OUTPUT REF CODE (9 digits)---------
                PRN_WHSP 25
                PRNSTR refMsg
                ; PRNSTR_COLOR RefMsg,29,1
                PRNSTR NL_2
                PRN_WHSP 35
                
                ; By outputing using Hex to Dec algorithm, 
                ; we get random-alike number that will change every centisecond
                ; COLORED REFCODE
                    MOV AH,9
                    MOV BH,0
                    MOV BL,30H; <--- color
                    MOV CX,9; <--- number of chars
                    INT 10H
                OUTPUT_FOURDIGITS RanRefCode1 ;Output whole CX
                OUTPUT_FIVEDIGITS RanRefCode2 ;Output whole DX
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
                    ;---CREATE FILE
                        MOV AH,3CH
                        LEA DX,fileName
                        MOV CX,1 ; TYPE OF FILE || 0 = Normal File 1 = Read Only
                        INT 21H
                    ;---OPENING the FILE
                        MOV AH,3DH
                        LEA DX,fileName
                        MOV AL,1 ; 1 MEAN FOR WRITING PURPOSE, 0 FOR READING MODE
                        INT 21H
                        MOV HANDLE,AX
                    ;---WRITING A FILE
                        MOV AH,40H
                        MOV BX,HANDLE
                        MOV CX,9 ; Bytes to write
                        LEA DX,RefCode
                        INT 21H
                    ;---CLOSE FILE
                        MOV AH,3EH
                        MOV DX,HANDLE
                        INT 21H
                ;---
        PRNSTR NL_2
        PRN_WHSP 25
        CALL PRESS_CONT
    ;---------------------END OF SECTION#10------------------------

    RESET:
        CALL RESET_PROC

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

    ENDING_LOGO:
        CALL CLS
        PRNSTR END_LOGO
        PRNSTR NL_2
        PRNSTR NL_1
        PRNSTR_COLOR END_LOGO_BLINK,45,0B1H
        PRNSTR NL_2
        PRNSTR NL_2
        PRNSTR NL_2
        DELAY 3000

    TERMINATE:
        MOV AH,4CH
        INT 21H
    
    EASTER_EGG:
        CALL CLS
        PRNSTR easterEggMsg
        DELAY 2000
        JMP START

MAIN ENDP
; <<<<<<<<<<<< Procedures >>>>>>>>>>>>
    CLS PROC
        ; Clear Screen
        MOV AH,00H
        MOV AL,02H
        INT 10H
        ; Colour customization 
        MOV AH,09h
        MOV CX,1000h
        MOV AL,20h
        MOV BL,3FH ; 3 = Cyan (Tiffany Blue), F = White
        INT 10H
        RET
    CLS ENDP
    PRESS_CONT PROC
        PRNSTR contMsg
        MOV AH,0
        INT 16H
        RET
    PRESS_CONT ENDP
    PRINT_STOCK_PROC PROC
        PRNSTR stockMsg
        PRN_CURR_ITEM_NAME currItemIndex
        PRNSTR stockMsg2
        OUTPUT_NUM [stockArr+SI]
        PRNSTR enterQuantityMsg
        OUTPUT_NUM [stockArr+SI]
        PRNSTR enterQuantityMsg2
        RET
    PRINT_STOCK_PROC ENDP
    MAX_ERROR_PROC PROC
        PRNSTR NL_1
        PRN_WHSP 5
        PRNSTR_COLOR maxStockErrorMsg,70,34H
        MOV AH,0
        INT 16H
        RET
    MAX_ERROR_PROC ENDP
    RESET_PROC PROC
        MOV CX,10
        MOV SI,0
        CLEAR_DATA:
            MOV [quantityArr+SI],0
            MOV [flaVarTracker+SI],0
            MOV [orderPriceIntArr+SI],0
            MOV [orderPriceManArr+SI],0
            MOV [ITEM_TYPE_IN_ORDER+SI],0
            INC SI
            INC SI
            LOOP CLEAR_DATA
        MOV hasOrder,0
        MOV totalPriceExclSST_INT,0
        MOV totalPriceExclSST_MAN,0
        MOV discount_INT,0
        MOV discount_MAN,0
        MOV discountedPrice_INT,0
        MOV discountedPrice_MAN,0
        MOV SSTCharge_INT,0
        MOV SSTCharge_MAN,0
        MOV totalPriceInclSST_INT,0
        MOV totalPriceInclSST_MAN,0
        MOV rounding_INT,0
        MOV rounding_MAN,0
        MOV finalTotal_INT,0
        MOV finalTotal_MAN,0
        MOV payAmount_INT,0
        MOV payAmount_MAN,0
        ; Reset Referral Code
        MOV RanRefCode1,0
        MOV RanRefCode2,0
        MOV HANDLE,0
        MOV CX,9
        MOV SI,0
        CLEAR_DATA_2:
            MOV RefCode[SI],0
            INC SI
            LOOP CLEAR_DATA_2
        RET
    RESET_PROC ENDP
        END MAIN
; <<<<<<<<<<<< End Procedures >>>>>>>>>>>>


; ┴┬┴┬／￣＼＿／￣＼
; ┬┴┬┴▏　　▏▔▔▔▔＼
; ┴┬┴／＼　／　　　　　　﹨
; ┬┴∕　　　　　　　／　　　
; ┴┬▏　　　　　　　　●　　▏
; ┬┴▏　　　　　　　　　　　▔█
; ┴◢██◣　　　　　　／＼＿＿／
; ┬█████◣　　　　　　　／　 　
; ┴█████████████◣　 ★
; ◢██████████████▆
; █◤◢██◣◥█████████ ＼　　
; ◥◢████　████████◤ 　 ＼
; ┴█████　██████◤　　 　　 ﹨
; ┬│　　　│█████◤　　　　 　　　▏
; ┴│　　　│　　　　　　　　　　 　　　▏
; ┬∕　　　∕　　　　／▔▔▔＼　 　　 ∕
; *∕＿＿_／﹨　　　∕　　　　　 ＼　　／＼
; ┴┬┴┬┴┬┴ ＼＿＿＿＼　　　　 ﹨／▔＼﹨／▔＼

; THIS PROGRAM IS DONE BY

; B & W ( BOON SUEN & WICKEY )

; 谢谢大家

; ////////////////////////////////////////////////////////////////////
; //                          _ooOoo_                               //
; //                         o8888888o                              //
; //                         88" . "88                              //
; //                         (| ^_^ |)                              //
; //                         O\  =  /O                              //
; //                      ____/`---'\____                           //
; //                    .'  \\|     |//  `.                         //
; //                   /  \\|||  :  |||//  \                        //
; //                  /  _||||| -:- |||||-  \                       //
; //                  |   | \\\  -  /// |   |                       //
; //                  | \_|  ''\---/''  |   |                       //
; //                  \  .-\__  `-`  ___/-. /                       //
; //                ___`. .'  /--.--\  `. . ___                     //
; //              ."" '<  `.___\_<|>_/___.'  >'"".                  //
; //            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
; //            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
; //      ========`-.____`-.___\_____/___.-`____.-'========         //
; //                           `=---='                              //
; //      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
; //            佛祖保佑       永不宕机     永无BUG                   //
; ////////////////////////////////////////////////////////////////////

; 佛祖加持 维尼站台