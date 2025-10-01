#decodeInstruction.rb

     
     
def decode(instructionList)
   
    outputList = [ "aa" , "bb" , "cc" ,"dd" ]
    
    opCodeI = 99999;
    
    opCodeI = instructionList[0].to_int

    opCode = opCodeI.to_hex(2)


    if ( opCode[0] == " " )
        
        opCode = opCode[ 1 .. 2 ]
        
    end
 
    case opCode
    
         when "00"     then mnemonic = "nop"          ; extraFetches = "0" ; addressMode = "0"            ; description = "NO OPERATION" ;
         when "01"     then mnemonic = "rst"          ; extraFetches = "0" ; addressMode = "0"            ; description = "RESET" ;
         when "02"     then mnemonic = "brk"          ; extraFetches = "0" ; addressMode = "0"            ; description = "BREAK / HALT" ;
         when "03"     then mnemonic = "call"         ; extraFetches = "2" ; addressMode = "absolute"     ; description = "CALL SUBROUTINE AT ADDRESS" ;
         when "04"     then mnemonic = "ret"          ; extraFetches = "0" ; addressMode = "0"            ; description = "RETURN FROM SUBROUTINE" ;
         when "05"     then mnemonic = "reti"         ; extraFetches = "0" ; addressMode = "0"            ; description = "RETURN FROM INTERRUPT" ;
         when "06"     then mnemonic = "beqz"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A == ZERO" ;
         when "07"     then mnemonic = "bneqz"        ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A != ZERO" ;
         when "08"     then mnemonic = "bpos"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A IS >= 0" ;
         when "09"     then mnemonic = "bneg"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A IS NEGATIVE" ;
         when "0a"     then mnemonic = "bxeqz"        ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF X == 0" ;
         when "0b"     then mnemonic = "bxneqz"       ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF X != 0" ;
         when "0c"     then mnemonic = "byeqz"        ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF Y == 0" ;
         when "0d"     then mnemonic = "byneqz"       ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF Y != 0" ;
         when "0e"     then mnemonic = "dxsz"         ; extraFetches = "0" ; addressMode = "relative"     ; description = "DECREMENT X AND SKIP NEXT INSTRUCTION IF X == 0" ;
         when "0f"     then mnemonic = "jmpr"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "UNCONDITIONAL RELATIVE JUMP" ;
         when "10"     then mnemonic = "jmpa"         ; extraFetches = "2" ; addressMode = "absolute"     ; description = "UNCONDITIONAL ABSOLUTE JUMP" ;
         when "11"     then mnemonic = "pusha"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH A ON TO STACK" ;
         when "12"     then mnemonic = "pushx"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH B ON TO STACK" ;
         when "13"     then mnemonic = "pushy"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH X ON TO STACK" ;
         when "14"     then mnemonic = "pushf"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH FLAGS ON TO STACK" ;
         when "15"     then mnemonic = "pushpc"       ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH PROGRAM COUNTER ON TO STACK" ;
         when "16"     then mnemonic = "popa"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP A FROM STACK" ;
         when "17"     then mnemonic = "popx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP B FROM STACK" ;
         when "18"     then mnemonic = "popy"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP X FROM STACK" ;
         when "19"     then mnemonic = "popf"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP FLAGS FROM STACK" ;
         when "1a"     then mnemonic = "poppc"        ; extraFetches = "0" ; addressMode = "0"            ; description = "POP PROGRAM COUNTER FROM STACK" ;
         when "1b"     then mnemonic = "ldai"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD A IMMEDIATE" ;
         when "1c"     then mnemonic = "lda"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD A ABSOLUTE" ;
         when "1d"     then mnemonic = "ldaix"        ; extraFetches = "2" ; addressMode = "indexed"      ; description = "LOAD A ( ADDRESS + X )" ;
         when "1e"     then mnemonic = "ldaii"        ; extraFetches = "2" ; addressMode = "indirect"     ; description = "LOAD A INDIRECTLY FROM THE POINTER SPECIFIED BY ADDRESS" ;
         when "1f"     then mnemonic = "ldxi"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD X IMMEDIATE" ;
         when "20"     then mnemonic = "ldx"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD X ABSOLUTE" ;
         when "21"     then mnemonic = "ldyi"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD Y IMMEDIATE" ;
         when "22"     then mnemonic = "ldy"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD Y ABSOLUTE" ;
         when "23"     then mnemonic = "sta"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE A ABSOLUTE" ;
         when "24"     then mnemonic = "staix"        ; extraFetches = "2" ; addressMode = "indexed"      ; description = "STORE A INDEXED" ;
         when "25"     then mnemonic = "staii"        ; extraFetches = "2" ; addressMode = "indirect"     ; description = "STORE A INDIRECT" ;
         when "26"     then mnemonic = "stx"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE X ABSOLUTE" ;
         when "27"     then mnemonic = "sty"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE Y ABSOLUTE" ;
         when "28"     then mnemonic = "inca"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT A" ;
         when "29"     then mnemonic = "incx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT X" ;
         when "2a"     then mnemonic = "incy"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT Y" ;
         when "2b"     then mnemonic = "deca"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT A" ;
         when "2c"     then mnemonic = "decx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT X" ;
         when "2d"     then mnemonic = "decy"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT Y" ;
         when "2e"     then mnemonic = "tax"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER A TO X" ;
         when "2f"     then mnemonic = "tay"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER A TO Y" ;
         when "30"     then mnemonic = "txa"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER X TO A" ;
         when "31"     then mnemonic = "tya"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER Y TO A" ;
         when "32"     then mnemonic = "txy"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER X TO Y" ;
         when "33"     then mnemonic = "tyx"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER Y TO X" ;
         when "34"     then mnemonic = "and"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A AND OPERAND" ;
         when "35"     then mnemonic = "or"           ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A OR OPERAND" ;
         when "36"     then mnemonic = "not"          ; extraFetches = "0" ; addressMode = "0"            ; description = "A = NOT A" ;
         when "37"     then mnemonic = "xor"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A XOR OPERAND" ;
         when "38"     then mnemonic = "lsl"          ; extraFetches = "1" ; addressMode = "immediate"    ; description = "A = A SHIFTED LEFT OPERAND TIMES" ;
         when "39"     then mnemonic = "lsr"          ; extraFetches = "1" ; addressMode = "immediate"    ; description = "A = A SHIFTED RIGHT OPERAND TIMES" ;
         when "3a"     then mnemonic = "add"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A + OPERAND" ;
         when "3b"     then mnemonic = "sub"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A - OPERAND" ;
         when "3c"     then mnemonic = "clc"          ; extraFetches = "0" ; addressMode = "0"            ; description = "CLEAR CARRY FLAG" ;
    
         else print "\nERROR: opCode ",opCode," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = mnemonic
    outputList[1] = extraFetches
    outputList[2] = addressMode
    outputList[3] = description

    return outputList
    end    
