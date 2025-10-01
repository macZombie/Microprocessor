#decoder.rb
def decode(instructionS)
    
   
    outputList = [ "XX" , "YY" , "ZZ" ,"QQ" ]
    
    case instructionS
    
         when "nop"     then hexS = "00" ; extraFetches = "0" ; addressMode = "0" ; description = "NO OPERATION" ;
         when "rst"     then hexS = "01" ; extraFetches = "0" ; addressMode = "0" ; description = "RESET" ;
         when "brk"     then hexS = "02" ; extraFetches = "0" ; addressMode = "0" ; description = "BREAK / HALT" ;
         when "call"    then hexS = "83" ; extraFetches = "2" ; addressMode = "absolute" ; description = "CALL SUBROUTINE AT ADDRESS" ;
         when "ret "    then hexS = "04" ; extraFetches = "0" ; addressMode = "0" ; description = "RETURN FROM SUBROUTINE" ;
         when "reti"    then hexS = "05" ; extraFetches = "0" ; addressMode = "0" ; description = "RETURN FROM INTERRUPT" ;
         when "beqz"    then hexS = "46" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF A == ZERO" ;
         when "bneqz"   then hexS = "47" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF A != ZERO" ;
         when "bpos"    then hexS = "48" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF A IS >= 0" ;
         when "bneg"    then hexS = "49" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF A IS NEGATIVE" ;
         when "bxeqz"   then hexS = "4a" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF X == 0" ;
         when "bxneqz"  then hexS = "4b" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF X != 0" ;
         when "dxsz"    then hexS = "0c" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT X AND SKIP NEXT INSTRUCTION IF X == 0" ;
         when "jmp#"    then hexS = "4d" ; extraFetches = "1" ; addressMode = "relative" ; description = "UNCONDITIONAL RELATIVE JUMP" ;
         when "jmp"     then hexS = "8e" ; extraFetches = "2" ; addressMode = "absolute" ; description = "UNCONDITIONAL ABSOLUTE JUMP" ;
         when "pusha"   then hexS = "0f" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH A ON TO STACK" ;
         when "pushb"   then hexS = "10" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH B ON TO STACK" ;
         when "pushx"   then hexS = "11" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH X ON TO STACK" ;
         when "pushf"   then hexS = "12" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH FLAGS ON TO STACK" ;
         when "pushpc"  then hexS = "13" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH PROGRAM COUNTER ON TO STACK" ;
         when "popa"    then hexS = "14" ; extraFetches = "0" ; addressMode = "0" ; description = "POP A FROM STACK" ;
         when "popb"    then hexS = "15" ; extraFetches = "0" ; addressMode = "0" ; description = "POP B FROM STACK" ;
         when "popx"    then hexS = "16" ; extraFetches = "0" ; addressMode = "0" ; description = "POP X FROM STACK" ;
         when "popf"    then hexS = "17" ; extraFetches = "0" ; addressMode = "0" ; description = "POP FLAGS FROM STACK" ;
         when "poppc"   then hexS = "18" ; extraFetches = "0" ; addressMode = "0" ; description = "POP PROGRAM COUNTER FROM STACK" ;
         when "lda#"    then hexS = "59" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD A IMMEDIATE" ;
         when "lda"     then hexS = "9a" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD A ABSOLUTE" ;
         when "ldaix "  then hexS = "9b" ; extraFetches = "2" ; addressMode = "indexed" ; description = "LOAD A ( ADDRESS + X )" ;
         when "ldai "   then hexS = "9c" ; extraFetches = "2" ; addressMode = "indirect" ; description = "LOAD A INDIRECTLY FROM THE POINTER SPECIFIED BY ADDRESS" ;
         when "ldb#"    then hexS = "5d" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD B IMMEDIATE" ;
         when "ldb"     then hexS = "9e" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD B ABSOLUTE" ;
         when "ldbix "  then hexS = "9f" ; extraFetches = "2" ; addressMode = "indexed" ; description = "LOAD B ( ADDRESS + X )" ;
         when "ldx#"    then hexS = "60" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD X IMMEDIATE" ;
         when "ldx"     then hexS = "a1" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD X ABSOLUTE" ;
         when "sta"     then hexS = "a2" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE A ABSOLUTE" ;
         when "staix"   then hexS = "a3" ; extraFetches = "2" ; addressMode = "indexed" ; description = "STORE A INDEXED" ;
         when "staii"   then hexS = "a4" ; extraFetches = "2" ; addressMode = "indirect" ; description = "STORE A INDIRECT" ;
         when "stb"     then hexS = "a5" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE B ABSOLUTE" ;
         when "stx"     then hexS = "a6" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE X ABSOLUTE" ;
         when "inca"    then hexS = "27" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT A" ;
         when "incb"    then hexS = "28" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT B" ;
         when "incx"    then hexS = "29" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT X" ;
         when "deca"    then hexS = "2a" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT A" ;
         when "decb"    then hexS = "2b" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT B" ;
         when "decx"    then hexS = "2c" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT X" ;
         when "tab"     then hexS = "2d" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER A TO B" ;
         when "tax"     then hexS = "2e" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER A TO X" ;
         when "tba"     then hexS = "2f" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER B TO A" ;
         when "tbx"     then hexS = "30" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER B TO X" ;
         when "txa"     then hexS = "31" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER X TO A" ;
         when "txb"     then hexS = "32" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER X TO B" ;
         when "and"     then hexS = "33" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A AND B" ;
         when "or"      then hexS = "34" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A OR B" ;
         when "not"     then hexS = "35" ; extraFetches = "0" ; addressMode = "0" ; description = "A = NOT A" ;
         when "xor"     then hexS = "36" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A XOR B" ;
         when "lsl"     then hexS = "77" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A SHIFTED LEFT OPERAND TIMES" ;
         when "lsr"     then hexS = "78" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A SHIFTED RIGHT OPERAND TIMES" ;
         when "add"     then hexS = "39" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A + B" ;
         when "sub"     then hexS = "3a" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A - B" ;
         when "in"      then hexS = "3b" ; extraFetches = "0" ; addressMode = "0" ; description = "A = INPUT PORT" ;
         when "out"     then hexS = "7c" ; extraFetches = "1" ; addressMode = "0" ; description = "OUTPUT PORT = A" ;
    
         else print "\nERROR: instruction ",instructionS," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = hexS
    outputList[1] = extraFetches
    outputList[2] = addressMode
    outputList[3] = description

    return outputList
    end    

     
     
def disassemble(instructionList)
   
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
         when "83"     then mnemonic = "call"         ; extraFetches = "2" ; addressMode = "absolute"     ; description = "CALL SUBROUTINE AT ADDRESS" ;
         when "04"     then mnemonic = "ret "         ; extraFetches = "0" ; addressMode = "0"            ; description = "RETURN FROM SUBROUTINE" ;
         when "05"     then mnemonic = "reti"         ; extraFetches = "0" ; addressMode = "0"            ; description = "RETURN FROM INTERRUPT" ;
         when "46"     then mnemonic = "beqz"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A == ZERO" ;
         when "47"     then mnemonic = "bneqz"        ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A != ZERO" ;
         when "48"     then mnemonic = "bpos"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A IS >= 0" ;
         when "49"     then mnemonic = "bneg"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF A IS NEGATIVE" ;
         when "4a"     then mnemonic = "bxeqz"        ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF X == 0" ;
         when "4b"     then mnemonic = "bxneqz"       ; extraFetches = "1" ; addressMode = "relative"     ; description = "BRANCH IF X != 0" ;
         when "0c"     then mnemonic = "dxsz"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT X AND SKIP NEXT INSTRUCTION IF X == 0" ;
         when "4d"     then mnemonic = "jmp#"         ; extraFetches = "1" ; addressMode = "relative"     ; description = "UNCONDITIONAL RELATIVE JUMP" ;
         when "8e"     then mnemonic = "jmp"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "UNCONDITIONAL ABSOLUTE JUMP" ;
         when "0f"     then mnemonic = "pusha"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH A ON TO STACK" ;
         when "10"     then mnemonic = "pushb"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH B ON TO STACK" ;
         when "11"     then mnemonic = "pushx"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH X ON TO STACK" ;
         when "12"     then mnemonic = "pushf"        ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH FLAGS ON TO STACK" ;
         when "13"     then mnemonic = "pushpc"       ; extraFetches = "0" ; addressMode = "0"            ; description = "PUSH PROGRAM COUNTER ON TO STACK" ;
         when "14"     then mnemonic = "popa"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP A FROM STACK" ;
         when "15"     then mnemonic = "popb"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP B FROM STACK" ;
         when "16"     then mnemonic = "popx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP X FROM STACK" ;
         when "17"     then mnemonic = "popf"         ; extraFetches = "0" ; addressMode = "0"            ; description = "POP FLAGS FROM STACK" ;
         when "18"     then mnemonic = "poppc"        ; extraFetches = "0" ; addressMode = "0"            ; description = "POP PROGRAM COUNTER FROM STACK" ;
         when "59"     then mnemonic = "lda#"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD A IMMEDIATE" ;
         when "9a"     then mnemonic = "lda"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD A ABSOLUTE" ;
         when "9b"     then mnemonic = "ldaix "       ; extraFetches = "2" ; addressMode = "indexed"      ; description = "LOAD A ( ADDRESS + X )" ;
         when "9c"     then mnemonic = "ldai "        ; extraFetches = "2" ; addressMode = "indirect"     ; description = "LOAD A INDIRECTLY FROM THE POINTER SPECIFIED BY ADDRESS" ;
         when "5d"     then mnemonic = "ldb#"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD B IMMEDIATE" ;
         when "9e"     then mnemonic = "ldb"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD B ABSOLUTE" ;
         when "9f"     then mnemonic = "ldbix "       ; extraFetches = "2" ; addressMode = "indexed"      ; description = "LOAD B ( ADDRESS + X )" ;
         when "60"     then mnemonic = "ldx#"         ; extraFetches = "1" ; addressMode = "immediate"    ; description = "LOAD X IMMEDIATE" ;
         when "a1"     then mnemonic = "ldx"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "LOAD X ABSOLUTE" ;
         when "a2"     then mnemonic = "sta"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE A ABSOLUTE" ;
         when "a3"     then mnemonic = "staix"        ; extraFetches = "2" ; addressMode = "indexed"      ; description = "STORE A INDEXED" ;
         when "a4"     then mnemonic = "staii"        ; extraFetches = "2" ; addressMode = "indirect"     ; description = "STORE A INDIRECT" ;
         when "a5"     then mnemonic = "stb"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE B ABSOLUTE" ;
         when "a6"     then mnemonic = "stx"          ; extraFetches = "2" ; addressMode = "absolute"     ; description = "STORE X ABSOLUTE" ;
         when "27"     then mnemonic = "inca"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT A" ;
         when "28"     then mnemonic = "incb"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT B" ;
         when "29"     then mnemonic = "incx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "INCREMENT X" ;
         when "2a"     then mnemonic = "deca"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT A" ;
         when "2b"     then mnemonic = "decb"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT B" ;
         when "2c"     then mnemonic = "decx"         ; extraFetches = "0" ; addressMode = "0"            ; description = "DECREMENT X" ;
         when "2d"     then mnemonic = "tab"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER A TO B" ;
         when "2e"     then mnemonic = "tax"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER A TO X" ;
         when "2f"     then mnemonic = "tba"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER B TO A" ;
         when "30"     then mnemonic = "tbx"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER B TO X" ;
         when "31"     then mnemonic = "txa"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER X TO A" ;
         when "32"     then mnemonic = "txb"          ; extraFetches = "0" ; addressMode = "0"            ; description = "TRANSFER X TO B" ;
         when "33"     then mnemonic = "and"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A AND B" ;
         when "34"     then mnemonic = "or"           ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A OR B" ;
         when "35"     then mnemonic = "not"          ; extraFetches = "0" ; addressMode = "0"            ; description = "A = NOT A" ;
         when "36"     then mnemonic = "xor"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A XOR B" ;
         when "77"     then mnemonic = "lsl"          ; extraFetches = "1" ; addressMode = "immediate"    ; description = "A = A SHIFTED LEFT OPERAND TIMES" ;
         when "78"     then mnemonic = "lsr"          ; extraFetches = "1" ; addressMode = "immediate"    ; description = "A = A SHIFTED RIGHT OPERAND TIMES" ;
         when "39"     then mnemonic = "add"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A + B" ;
         when "3a"     then mnemonic = "sub"          ; extraFetches = "1" ; addressMode = "immediate"            ; description = "A = A - B" ;
         when "3b"     then mnemonic = "in"           ; extraFetches = "0" ; addressMode = "0"            ; description = "A = INPUT PORT" ;
         when "7c"     then mnemonic = "out"          ; extraFetches = "1" ; addressMode = "0"            ; description = "OUTPUT PORT = A" ;
    
         else print "\nERROR: opCode ",opCode," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = mnemonic
    outputList[1] = extraFetches
    outputList[2] = addressMode
    outputList[3] = description

    return outputList
    end    
