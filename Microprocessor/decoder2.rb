#decoder2.rb
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
         when "byeqz"   then hexS = "4c" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF Y == 0" ;
         when "byneqz"  then hexS = "4d" ; extraFetches = "1" ; addressMode = "relative" ; description = "BRANCH IF Y != 0" ;
         when "dxsz"    then hexS = "0e" ; extraFetches = "0" ; addressMode = "relative" ; description = "DECREMENT X AND SKIP NEXT INSTRUCTION IF X == 0" ;
         when "jmpr"    then hexS = "4f" ; extraFetches = "1" ; addressMode = "relative" ; description = "UNCONDITIONAL RELATIVE JUMP" ;
         when "jmpa"    then hexS = "90" ; extraFetches = "2" ; addressMode = "absolute" ; description = "UNCONDITIONAL ABSOLUTE JUMP" ;
         when "pusha"   then hexS = "11" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH A ON TO STACK" ;
         when "pushb"   then hexS = "12" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH B ON TO STACK" ;
         when "pushx"   then hexS = "13" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH X ON TO STACK" ;
         when "pushf"   then hexS = "14" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH FLAGS ON TO STACK" ;
         when "pushpc"  then hexS = "15" ; extraFetches = "0" ; addressMode = "0" ; description = "PUSH PROGRAM COUNTER ON TO STACK" ;
         when "popa"    then hexS = "16" ; extraFetches = "0" ; addressMode = "0" ; description = "POP A FROM STACK" ;
         when "popb"    then hexS = "17" ; extraFetches = "0" ; addressMode = "0" ; description = "POP B FROM STACK" ;
         when "popx"    then hexS = "18" ; extraFetches = "0" ; addressMode = "0" ; description = "POP X FROM STACK" ;
         when "popf"    then hexS = "19" ; extraFetches = "0" ; addressMode = "0" ; description = "POP FLAGS FROM STACK" ;
         when "poppc"   then hexS = "1a" ; extraFetches = "0" ; addressMode = "0" ; description = "POP PROGRAM COUNTER FROM STACK" ;
         when "ldai"    then hexS = "5b" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD A IMMEDIATE" ;
         when "lda"     then hexS = "9c" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD A ABSOLUTE" ;
         when "ldaix "  then hexS = "9d" ; extraFetches = "2" ; addressMode = "indexed" ; description = "LOAD A ( ADDRESS + X )" ;
         when "ldaii "  then hexS = "9e" ; extraFetches = "2" ; addressMode = "indirect" ; description = "LOAD A INDIRECTLY FROM THE POINTER SPECIFIED BY ADDRESS" ;
         when "ldxi"    then hexS = "5f" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD X IMMEDIATE" ;
         when "ldx"     then hexS = "a0" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD X ABSOLUTE" ;
         when "ldyi"    then hexS = "61" ; extraFetches = "1" ; addressMode = "immediate" ; description = "LOAD Y IMMEDIATE" ;
         when "ldyi"    then hexS = "a2" ; extraFetches = "2" ; addressMode = "absolute" ; description = "LOAD Y ABSOLUTE" ;
         when "sta"     then hexS = "a3" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE A ABSOLUTE" ;
         when "staix"   then hexS = "a4" ; extraFetches = "2" ; addressMode = "indexed" ; description = "STORE A INDEXED" ;
         when "staii"   then hexS = "a5" ; extraFetches = "2" ; addressMode = "indirect" ; description = "STORE A INDIRECT" ;
         when "stx"     then hexS = "a6" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE X ABSOLUTE" ;
         when "sty"     then hexS = "a7" ; extraFetches = "2" ; addressMode = "absolute" ; description = "STORE Y ABSOLUTE" ;
         when "inca"    then hexS = "28" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT A" ;
         when "incx"    then hexS = "29" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT X" ;
         when "incy"    then hexS = "2a" ; extraFetches = "0" ; addressMode = "0" ; description = "INCREMENT Y" ;
         when "deca"    then hexS = "2b" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT A" ;
         when "decx"    then hexS = "2c" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT X" ;
         when "decy"    then hexS = "2d" ; extraFetches = "0" ; addressMode = "0" ; description = "DECREMENT Y" ;
         when "tax"     then hexS = "2e" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER A TO X" ;
         when "tay"     then hexS = "2f" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER A TO Y" ;
         when "txa"     then hexS = "30" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER X TO A" ;
         when "tya"     then hexS = "31" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER Y TO A" ;
         when "txy"     then hexS = "32" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER X TO Y" ;
         when "tyx"     then hexS = "33" ; extraFetches = "0" ; addressMode = "0" ; description = "TRANSFER Y TO X" ;
         when "and"     then hexS = "34" ; extraFetches = "0" ; addressMode = "0" ; description = "A = A AND B" ;
         when "or"      then hexS = "35" ; extraFetches = "0" ; addressMode = "0" ; description = "A = A OR B" ;
         when "not"     then hexS = "36" ; extraFetches = "0" ; addressMode = "0" ; description = "A = NOT A" ;
         when "xor"     then hexS = "37" ; extraFetches = "0" ; addressMode = "0" ; description = "A = A XOR B" ;
         when "lsl"     then hexS = "78" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A SHIFTED LEFT OPERAND TIMES" ;
         when "lsr"     then hexS = "79" ; extraFetches = "1" ; addressMode = "immediate" ; description = "A = A SHIFTED RIGHT OPERAND TIMES" ;
         when "add"     then hexS = "3a" ; extraFetches = "0" ; addressMode = "0" ; description = "A = A + B" ;
         when "sub"     then hexS = "3b" ; extraFetches = "0" ; addressMode = "0" ; description = "A = A - B" ;
