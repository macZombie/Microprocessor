#executor.rb

     

def execute(executionList,operand) 
  
    mnemonic = executionList[0]
        
    jump = 0
        
    case mnemonic
   

    
         when "nop"; outcome = doNOP(executionList , operand ) ; end ;
         when "rst"; outcome = doRST(executionList , operand ) ; end ;
         when "brk"; outcome = doBRK(executionList , operand ) ; end ;
         when "call"; outcome = doCALL(executionList , operand ) ; end ;
         when "ret"; outcome = doRET(executionList , operand ) ; end ;
         when "reti"; outcome = doRETI(executionList , operand ) ; end ;
         when "beqz"; outcome = doBEQZ(executionList , operand ) ; end ;
         when "bneqz"; outcome = doBNEQZ(executionList , operand ) ; end ;
         when "bpos"; outcome = doBPOS(executionList , operand ) ; end ;
         when "bneg"; outcome = doBNEG(executionList , operand ) ; end ;
         when "bxeqz"; outcome = doBXEQZ(executionList , operand ) ; end ;
         when "bxneqz"; outcome = doBXNEQZ(executionList , operand ) ; end ;
         when "byeqz"; outcome = doBYEQZ(executionList , operand ) ; end ;
         when "byneqz"; outcome = doBYNEQZ(executionList , operand ) ; end ;
         when "dxsz"; outcome = doDXSZ(executionList , operand ) ; end ;
         when "jmpr"; outcome = doJMPR(executionList , operand ) ; end ;
         when "jmpa"; outcome = doJMPA(executionList , operand ) ; end ;
         when "pusha"; outcome = doPUSHA(executionList , operand ) ; end ;
         when "pushx"; outcome = doPUSHX(executionList , operand ) ; end ;
         when "pushy"; outcome = doPUSHY(executionList , operand ) ; end ;
         when "pushf"; outcome = doPUSHF(executionList , operand ) ; end ;
         when "pushpc"; outcome = doPUSHPC(executionList , operand ) ; end ;
         when "popa"; outcome = doPOPA(executionList , operand ) ; end ;
         when "popx"; outcome = doPOPX(executionList , operand ) ; end ;
         when "popy"; outcome = doPOPY(executionList , operand ) ; end ;
         when "popf"; outcome = doPOPF(executionList , operand ) ; end ;
         when "poppc"; outcome = doPOPPC(executionList , operand ) ; end ;
         when "ldai"; outcome = doLDAI(executionList , operand ) ; end ;
         when "lda"; outcome = doLDA(executionList , operand ) ; end ;
         when "ldaix"; outcome = doLDAIX(executionList , operand ) ; end ;
         when "ldaii"; outcome = doLDAII(executionList , operand ) ; end ;
         when "ldxi"; outcome = doLDXI(executionList , operand ) ; end ;
         when "ldx"; outcome = doLDX(executionList , operand ) ; end ;
         when "ldyi"; outcome = doLDYI(executionList , operand ) ; end ;
         when "ldy"; outcome = doLDY(executionList , operand ) ; end ;
         when "sta"; outcome = doSTA(executionList , operand ) ; end ;
         when "staix"; outcome = doSTAIX(executionList , operand ) ; end ;
         when "staii"; outcome = doSTAII(executionList , operand ) ; end ;
         when "stx"; outcome = doSTX(executionList , operand ) ; end ;
         when "sty"; outcome = doSTY(executionList , operand ) ; end ;
         when "inca"; outcome = doINCA(executionList , operand ) ; end ;
         when "incx"; outcome = doINCX(executionList , operand ) ; end ;
         when "incy"; outcome = doINCY(executionList , operand ) ; end ;
         when "deca"; outcome = doDECA(executionList , operand ) ; end ;
         when "decx"; outcome = doDECX(executionList , operand ) ; end ;
         when "decy"; outcome = doDECY(executionList , operand ) ; end ;
         when "tax"; outcome = doTAX(executionList , operand ) ; end ;
         when "tay"; outcome = doTAY(executionList , operand ) ; end ;
         when "txa"; outcome = doTXA(executionList , operand ) ; end ;
         when "tya"; outcome = doTYA(executionList , operand ) ; end ;
         when "txy"; outcome = doTXY(executionList , operand ) ; end ;
         when "tyx"; outcome = doTYX(executionList , operand ) ; end ;
         when "and"; outcome = doAND(executionList , operand ) ; end ;
         when "or"; outcome = doOR(executionList , operand ) ; end ;
         when "not"; outcome = doNOT(executionList , operand ) ; end ;
         when "xor"; outcome = doXOR(executionList , operand ) ; end ;
         when "lsl"; outcome = doLSL(executionList , operand ) ; end ;
         when "lsr"; outcome = doLSR(executionList , operand ) ; end ;
         when "add"; outcome = doADD(executionList , operand ) ; end ;
         when "sub"; outcome = doSUB(executionList , operand ) ; end ;
         when "clc"; outcome = doCLC(executionList , operand ) ; end ;
 
                     
         else print "\nERROR: mnemonic >",mnemonic,"< not identified.\n\n" ; Process.exit(0) 

        end # of case
        
        return outcome
        
    end
    
