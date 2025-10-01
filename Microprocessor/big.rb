   case mnemonic
    
         when "nop"      then  jump =  doNOP(executionList) ;
         when "rst"      then  jump =  doRST(executionList) ;
         when "brk"      then  jump =  doBRK(executionList) ;
         when "call"     then  jump =  doCAL(executionList) ;
         when "ret "     then  jump =  doRET(executionList) ;
         when "reti"     then  jump =  doRETI(executionList) ;
         when "beqz"     then  jump =  doBEQZ(executionList) ;
         when "bneqz"    then  jump =  doBNEQZ(executionList) ;
         when "bpos"     then  jump =  doBPOS(executionList) ;
         when "bneg"     then  jump =  doBNEG(executionList) ;
         when "bxeqz"    then  jump =  doBXEQZ(executionList) ;
         when "bxneqz"   then  jump =  doBXNEQZ(executionList) ;
         when "dxsz"     then  jump =  doDXSZ(executionList) ;
         when "jmp#"     then  jump =  doJMP#(executionList) ;
         when "jmp"      then  jump =  doJMP(executionList) ;
         when "pusha"    then  jump =  doPUSHA(executionList) ;
         when "pushb"    then  jump =  doPUSHB(executionList) ;
         when "pushx"    then  jump =  doPUSHX(executionList) ;
         when "pushf"    then  jump =  doPUSHF(executionList) ;
         when "pushpc"   then  jump =  doPUSHPC(executionList) ;
         when "popa"     then  jump =  doPOPA(executionList) ;
         when "popb"     then  jump =  doPOPB(executionList) ;
         when "popx"     then  jump =  doPOPX(executionList) ;
         when "popf"     then  jump =  doPOPF(executionList) ;
         when "poppc"    then  jump =  doPOPPC(executionList) ;
         when "lda#"     then  jump =  doLDA#(executionList) ;
         when "lda"      then  jump =  doLDA(executionList) ;
         when "ldaix"    then  jump =  doLDAIX(executionList) ;
         when "ldai"     then  jump =  doLDAI(executionList) ;
         when "ldb#"     then  jump =  doLDB#(executionList) ;
         when "ldb"      then  jump =  doLDB(executionList) ;
         when "ldbix"    then  jump =  doLDBIX(executionList) ;
         when "ldx#"     then  jump =  doLDX#(executionList) ;
         when "ldx"      then  jump =  doLDX(executionList) ;
         when "sta"      then  jump =  doSTA(executionList) ;
         when "staix"    then  jump =  doSTAIX(executionList) ;
         when "staii"    then  jump =  doSTAII(executionList) ;
         when "stb"      then  jump =  doSTB(executionList) ;
         when "stx"      then  jump =  doSTX(executionList) ;
         when "inca"     then  jump =  doINCA(executionList) ;
         when "incb"     then  jump =  doINCB(executionList) ;
         when "incx"     then  jump =  doINCX(executionList) ;
         when "deca"     then  jump =  doDECA(executionList) ;
         when "decb"     then  jump =  doDECB(executionList) ;
         when "decx"     then  jump =  doDECX(executionList) ;
         when "tab"      then  jump =  doTAB(executionList) ;
         when "tax"      then  jump =  doTAX(executionList) ;
         when "tba"      then  jump =  doTBA(executionList) ;
         when "tbx"      then  jump =  doTBX(executionList) ;
         when "txa"      then  jump =  doTXA(executionList) ;
         when "txb"      then  jump =  doTXB(executionList) ;
         when "and"      then  jump =  doAND(executionList) ;
         when "or"       then  jump =  doOR(executionList) ;
         when "not"      then  jump =  doNOT(executionList) ;
         when "xor"      then  jump =  doXOR(executionList) ;
         when "lsl"      then  jump =  doLSL(executionList) ;
         when "lsr"      then  jump =  doLSR(executionList) ;
         when "add"      then  jump =  doADD(executionList) ;
         when "sub"      then  jump =  doSUB(executionList) ;
         when "in"       then  jump =  doIN (executionList) ;
         when "out"      then  jump =  doOUT(executionList) ;
    
    
    
    
    
    def doNOP(executionList)   ;       ; jump = result ; return result ;
    def doRST(executionList)   ;       ; jump = result ; return result ;
    def doBRK(executionList)   ;       ; jump = result ; return result ;
    def doCAL(executionList)   ;       ; jump = result ; return result ;
    def doRET(executionList)   ;       ; jump = result ; return result ;
    def doRETI(executionList)  ;       ; jump = result ; return result ;
    def doBEQZ(executionList)  ;       ; jump = result ; return result ;
    def doBNEQZ(executionList) ;       ; jump = result ; return result ;
    def doBPOS(executionList)  ;       ; jump = result ; return result ;
    def doBNEG(executionList)  ;       ; jump = result ; return result ;
    def doBXEQZ(executionList) ;       ; jump = result ; return result ;
    def doBXNEQZ(executionList ;       ; jump = result ; return result ;
    def doDXSZ(executionList)  ;       ; jump = result ; return result ;
    def doJMP#(executionList)  ;       ; jump = result ; return result ;
    def doJMP(executionList)   ;       ; jump = result ; return result ;
    def doPUSHA(executionList) ;       ; jump = result ; return result ;
    def doPUSHB(executionList) ;       ; jump = result ; return result ;
    def doPUSHX(executionList) ;       ; jump = result ; return result ;
    def doPUSHF(executionList) ;       ; jump = result ; return result ;
    def doPUSHPC(executionList);       ; jump = result ; return result ;
    def doPOPA(executionList)  ;       ; jump = result ; return result ; 
    def doPOPB(executionList)  ;       ; jump = result ; return result ; 
    def doPOPX(executionList)  ;       ; jump = result ; return result ; 
    def doPOPF(executionList)  ;       ; jump = result ; return result ; 
    def doPOPPC(executionList) ;       ; jump = result ; return result ;
    def doLDA#(executionList)  ;       ; jump = result ; return result ; 
    def doLDA(executionList)   ;       ; jump = result ; return result ;
    def doLDAIX(executionList) ;       ; jump = result ; return result ;
    def doLDAI(executionList)  ;       ; jump = result ; return result ;
    def doLDB#(executionList)  ;       ; jump = result ; return result ;
    def doLDB(executionList)   ;       ; jump = result ; return result ;
    def doLDBIX(executionList) ;       ; jump = result ; return result ; 
    def doLDX#(executionList)  ;       ; jump = result ; return result ; 
    def doLDX(executionList)   ;       ; jump = result ; return result ;
    def doSTA(executionList)   ;       ; jump = result ; return result ;
    def doSTAIX(executionList) ;       ; jump = result ; return result ;
    def doSTAII(executionList) ;       ; jump = result ; return result ;
    def doSTB(executionList)   ;       ; jump = result ; return result ;
    def doSTX(executionList)   ;       ; jump = result ; return result ;
    def doINCA(executionList)  ;       ; jump = result ; return result ;
    def doINCB(executionList)  ;       ; jump = result ; return result ;
    def doINCX(executionList)  ;       ; jump = result ; return result ;
    def doDECA(executionList)  ;       ; jump = result ; return result ;
    def doDECB(executionList)  ;       ; jump = result ; return result ;
    def doDECX(executionList)  ;       ; jump = result ; return result ;
    def doTAB(executionList)   ;       ; jump = result ; return result ;
    def doTAX(executionList)   ;       ; jump = result ; return result ;
    def doTBA(executionList)   ;       ; jump = result ; return result ;
    def doTBX(executionList)   ;       ; jump = result ; return result ;
    def doTXA(executionList)   ;       ; jump = result ; return result ;
    def doTXB(executionList)   ;       ; jump = result ; return result ;
    def doAND(executionList)   ;       ; jump = result ; return result ;
    def doOR(executionList)    ;       ; jump = result ; return result ;
    def doNOT(executionList)   ;       ; jump = result ; return result ;
    def doXOR(executionList)   ;       ; jump = result ; return result ;
    def doLSL(executionList)   ;       ; jump = result ; return result ;
    def doLSR(executionList)   ;       ; jump = result ; return result ;
    def doADD(executionList)   ;       ; jump = result ; return result ;
    def doSUB(executionList)   ;       ; jump = result ; return result ;
    def doIN (executionList)   ;       ; jump = result ; return result ;
    def doOUT(executionList)   ;       ; jump = result ; return result ;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 