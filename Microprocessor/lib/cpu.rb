# cpu.rb

class CPU
    
    @pc
    @a
    @b
    @x
    @y
    @sp
    @f
    @inputPort
    @outputPort
  
    
    
    def initialize
        
        # memory.dump # check to make sure that the RAM is accessible N/A
        
        @pc  = rand( 0 .. 255 )
        @a  = rand( 0 .. 255 )
        @b = rand( 0 .. 255 )
        @x = rand( 0 .. 255 )
        @y = rand( 0 .. 255 )
        @sp = rand( 0 .. 255 )
        @f  = rand( 0 .. 255 )
        @inputPort  = rand( 0 .. 255 )
        @outputPort  = rand( 0 .. 255 )
    
        return
        
    end
    

    def setPC(value)
        
        @pc = value
        
        if ( value == 0 )
            setF(0) # do this first, then setA will do the flags
            setA(0)
            setB(0)
            setX(0)
            setY(0)
            setInput(0)
            setOutput(0)
            setSP(65535)
            
            
            
        end
        
        
        
        
    end
    
    
    
    
    
    
    
    
    def setA(value) 

        if ( value > 255 )
            
            print "\n\nWARNING: writing more than 8 bits to A. Value was ",value,"(dec)",value.to_hex(2),"(hex)\n"
            setC(1)
            # Process.exit(0)
            
        end

        @a = value & 255 ;
        
        if ( value == 0 )
            setZ(1)
        else
            setZ(0)
        end
        
         
        if ( ( value & 128 )  ==  0 )
            setN(0)
        else
            setN(1)
        end       
        


    end
    
    
    
    
    def setB(value)       ;   @b          = ( value ) ; end
    def setX(value)       ;   @x          = ( value & 255 ) ; end
    def setY(value)       ;   @y          = ( value & 255 ) ; end
    def setSP(value)      ;   @sp         = ( value ) ; end
    def setF(value)       ;   @f          = ( value ) ; end
    def setInput(value)   ;   @inputPort  = ( value ) ; end
    def setOutput(value)  ;   @outputPort = ( value ) ; end
    
    
    def setZ(value)
        
        status = getF
        
        if ( value == 0 )
            
            status = status & 127
            
        else
            
            status = status | 128
            
        end
        
        setF(status)
        
        
    end
    
    
        
    def setN(value)
        
        status = getF
        
        if ( value == 0 )
            
            status = status & 191
            
        else
            
            status = status | 64
            
        end
        
        setF(status)
        
        
    end
    
    
    def setI(value)
        
        status = getF
        
        if ( value == 0 )
            
            status = status & 223
            
        else
            
            status = status | 32
            
        end
        
        setF(status)
        
        
    end
    
    
    
    def setC(value)
        
        status = getF
        
        if ( value == 0 )
            
            status = status & 239
            
        else
            
            status = status | 16
            
        end
        
        setF(status)
        
        
    end
    
  

    def getPC     ; value =  @pc         ; return value  ; end
    def getA      ; value =  @a          ; return value  ; end
    def getB      ; value =  @b          ; return value  ; end
    def getX      ; value =  @x          ; return value  ; end
    def getY      ; value =  @y          ; return value  ; end
    def getSP     ; value =  @sp         ; return value  ; end
    def getF      ; value =  @f          ; return value  ; end
    def getInput  ; value =  @inputPort  ; return value  ; end
    def getOutput ; value =  @outputPort ; return value  ; end
    
    
    def getHeader

        outputString = ""

        outputString = outputString + "PC".ljust(8)
        outputString = outputString + "A".ljust(4)
        #outputString = outputString + "B".ljust(4)
        outputString = outputString + "X".ljust(4)
        outputString = outputString + "Y".ljust(4)
        outputString = outputString + "ZNIC----".ljust(10)
        outputString = outputString + "SP".ljust(5)
        outputString = outputString + "IN".ljust(4)
        outputString = outputString + "OUT".ljust(8)
        
        
        return outputString
        
    end
  


    def getStatus

        outputString = ""
        
        outputString = outputString + "["
        outputString = outputString + getPC.to_hex(4).strip!
        outputString = outputString + "]"
        outputString = outputString.ljust(10) 
        
        #   outputString = outputString + getA.to_hex(2).ljust(4)
        #   outputString = outputString + getB.to_hex(2).ljust(4)
        #   outputString = outputString + getX.to_hex(2).ljust(4)
        
        
        outputString = outputString + getA.toUHex2.ljust(4)
        #outputString = outputString + getB.toUHex2.ljust(4)
        outputString = outputString + getX.toUHex2.ljust(4)
        outputString = outputString + getY.toUHex2.ljust(4)
        
        outputString = outputString + getF.to_bin(8).ljust(6)
        outputString = outputString + getSP.to_hex(4).ljust(6)
        outputString = outputString + getInput.to_hex(2).ljust(4)
        outputString = outputString + getOutput.to_hex(2).ljust(4)

        
        return outputString
        
    end
    
    
    def hardReset
        
        setPC(0)
 
        return
        
    end
    
    
    
    def run
        
        count = 0
        
        $brk = false;
        
        $address = getPC
        
        jumping = false
        
        begin
        
            instructionList = [ "" , "" , "" ]
        
            setPC($address)
            
            data = $m.read($address)
            
            # print "\n",address.to_hex(4)," ",data.to_hex(2)
            
            instructionList[0] = data
            
            decodedList = decode( instructionList )
            
            #print "\n",decodedList
            
            
            $listFile.write( $address.to_hex(4) + "  " + instructionList.to_s.ljust(16) + " | " + decodedList.to_s.ljust(64) + " | " )

            mnemonic     =  decodedList[0] 
            extraFetch   =  decodedList[1].to_i
            addressMode  =  decodedList[2] 
            description  =  decodedList[3] 
            

            
            if ( extraFetch == 0 )
               
                operand = ""
                
            end
            
            
            if ( extraFetch == 1 )
                
                #print "\nextraFetching"," ",$m.read($address + 1 )
                
                

                operandI = $m.read($address + 1 ).to_i
                
                operand = operandI.to_hex(2)
                
            end
            
            if ( extraFetch == 2 )
                msb = $m.read($address + 1 ).to_i
                lsb = $m.read($address + 2 ).to_i
                operandI = ( msb << 8 ) | lsb 
                operand = operandI.to_hex(4)
                
            end
            
            

            machineCodeString = ("[" + $address.to_hex(4).strip + "]").ljust(8)  + ( data.to_hex(2) + operand ).ljust(10) + " | "
            
            assemblyCodeString = mnemonic.ljust(6) + operand.ljust(6) + " | "
            

            
            descriptionString = description.ljust(40) + " | "
            
            
            #print "\n",machineCodeString + assemblyCodeString + descriptionString + getStatus
            
            #   print "\nmnemonic     = ",mnemonic      
            #   print "\nextraFetch   = ",extraFetch   
            #   print "\naddressMode  = ",addressMode   
            #   print "\ndescription  = ",description 
            #   print "\noperand = ",operand
            
            #print "\ndecoded list is ",decodedList

            outcome = execute(decodedList,operand)
            
            #print "\n",outcome
            
            jumpString = outcome[1] + " " + outcome[2]
            
                        
            #print "\n",machineCodeString + assemblyCodeString + descriptionString + getStatus + " |    jumpType = " + jumpString
             print "\n",machineCodeString + assemblyCodeString + descriptionString + getStatus + " | "
          


            #$address = $address + 1 + extraFetch
            
            $address = outcome[0]

            #count = count + 1
                
        end while ( ( $brk == false ) && ( count < 20 ) ) 
        
        
        
        
        return
        
    end
    
    def getMachineCodeHeader
        str = " ".ljust(74)
        return str
    end
    
        
        
        
   #executor.rb

     

def execute(executionList,operand) 
  
    mnemonic = executionList[0]
    
    #print "\nexecute ",executionList," ",operand
        
    jump = 0
        
    case mnemonic
   
         when "nop"; outcome = doNOP(executionList , operand ) ;
         when "rst"; outcome = doRST(executionList , operand ) ;
         when "brk"; outcome = doBRK(executionList , operand ) ;
         when "call"; outcome = doCALL(executionList , operand ) ; 
         when "ret"; outcome = doRET(executionList , operand ) ; 
         when "reti"; outcome = doRETI(executionList , operand ) ; 
         when "beqz"; outcome = doBEQZ(executionList , operand ) ; 
         when "bneqz"; outcome = doBNEQZ(executionList , operand )  ;
         when "bpos"; outcome = doBPOS(executionList , operand ) ; 
         when "bneg"; outcome = doBNEG(executionList , operand ) ; 
         when "bxeqz"; outcome = doBXEQZ(executionList , operand ) ; 
         when "bxneqz"; outcome = doBXNEQZ(executionList , operand ) ; 
         when "byeqz"; outcome = doBYEQZ(executionList , operand ) ; 
         when "byneqz"; outcome = doBYNEQZ(executionList , operand ) ; 
         when "dxsz"; outcome = doDXSZ(executionList , operand ) ; 
         when "jmpr"; outcome = doJMPR(executionList , operand ) ; 
         when "jmpa"; outcome = doJMPA(executionList , operand ) ; 
         when "pusha"; outcome = doPUSHA(executionList , operand ) ; 
         when "pushx"; outcome = doPUSHX(executionList , operand ) ; 
         when "pushy"; outcome = doPUSHY(executionList , operand ) ; 
         when "pushf"; outcome = doPUSHF(executionList , operand ) ; 
         when "pushpc"; outcome = doPUSHPC(executionList , operand ) ; 
         when "popa"; outcome = doPOPA(executionList , operand ) ; 
         when "popx"; outcome = doPOPX(executionList , operand ) ; 
         when "popy"; outcome = doPOPY(executionList , operand ) ; 
         when "popf"; outcome = doPOPF(executionList , operand ) ; 
         when "poppc"; outcome = doPOPPC(executionList , operand ) ; 
         when "ldai"; outcome = doLDAI(executionList , operand ) ; 
         when "lda"; outcome = doLDA(executionList , operand ) ; 
         when "ldaix"; outcome = doLDAIX(executionList , operand ) ; 
         when "ldaii"; outcome = doLDAII(executionList , operand ) ; 
         when "ldxi"; outcome = doLDXI(executionList , operand ) ; 
         when "ldx"; outcome = doLDX(executionList , operand ) ; 
         when "ldyi"; outcome = doLDYI(executionList , operand ) ; 
         when "ldy"; outcome = doLDY(executionList , operand ) ; 
         when "sta"; outcome = doSTA(executionList , operand ) ; 
         when "staix"; outcome = doSTAIX(executionList , operand ) ; 
         when "staii"; outcome = doSTAII(executionList , operand ) ; 
         when "stx"; outcome = doSTX(executionList , operand ) ; 
         when "sty"; outcome = doSTY(executionList , operand ) ; 
         when "inca"; outcome = doINCA(executionList , operand ) ; 
         when "incx"; outcome = doINCX(executionList , operand ) ; 
         when "incy"; outcome = doINCY(executionList , operand ) ; 
         when "deca"; outcome = doDECA(executionList , operand ) ; 
         when "decx"; outcome = doDECX(executionList , operand ) ; 
         when "decy"; outcome = doDECY(executionList , operand ) ; 
         when "tax"; outcome = doTAX(executionList , operand ) ; 
         when "tay"; outcome = doTAY(executionList , operand ) ; 
         when "txa"; outcome = doTXA(executionList , operand ) ; 
         when "tya"; outcome = doTYA(executionList , operand ) ; 
         when "txy"; outcome = doTXY(executionList , operand ) ; 
         when "tyx"; outcome = doTYX(executionList , operand ) ; 
         when "and"; outcome = doAND(executionList , operand ) ; 
         when "or"; outcome = doOR(executionList , operand ) ; 
         when "not"; outcome = doNOT(executionList , operand ) ; ;
         when "xor"; outcome = doXOR(executionList , operand ) ; ;
         when "lsl"; outcome = doLSL(executionList , operand ) ; ;
         when "lsr"; outcome = doLSR(executionList , operand ) ; ;
         when "add"; outcome = doADD(executionList , operand ) ; ;
         when "sub"; outcome = doSUB(executionList , operand ) ; ;
         when "clc"; outcome = doCLC(executionList , operand ) ; 
 
                     
         else print "\nERROR: mnemonic >",mnemonic,"< not identified.\n\n" ; Process.exit(0) 

        end # of case
        
        return outcome
        
    end
    
    
    
    #machineFunctions.rb
        
        def doNOP( executionList , operand  ) ; targetAddress = $address + executionList[1].to_i + 1 ; outcome = [targetAddress,"none","",""] ; return outcome ; end
        def doRST( executionList , operand  ) ; hardReset ; targetAddress = 0 ; outcome = [targetAddress,"unconditional","absolute",""] ; return outcome ; end
        def doBRK( executionList , operand  ) ; $brk = true ; targetAddress = $address + executionList[1].to_i + 1 ; outcome = [targetAddress,"none","",""] ; return outcome ; end
        def doCALL( executionList , operand  )

            returnAddress = getPC + 3
            
            $stack.push(returnAddress)

            targetAddress = operand.hex_to_dec
            
            setPC(targetAddress) 
        
            outcome = [targetAddress,"unconditional","absolute","" ] 
            
            return outcome 
            
        end
         
         
        def doRET( executionList , operand  )
            
            returnAddress = $stack.pop
            
            setPC(returnAddress)
            
            
            outcome = [returnAddress,"uncoditional","implied","" ] ; 
            return outcome  
        end 
        
        
        
        
        def doRETI( executionList , operand  )         ; outcome = ["DE","AD","BE","EF" ] ; return outcome ;  end ;
        def doBEQZ( executionList , operand  )
            #print "\ndoBEQZ ",executionList ," ", operand 
            
            #print "\nThe operand is ",operand
            
            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec
            
            #print "\nthe jump is = ",jump," = ",jump.to_hex(2)
        
        
        
            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
                
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            
            #print "\ndefaultTargetAddress = ",defaultTargetAddress.to_hex(4)
            
            #print "\nbranchTargetAddress = ",branchTargetAddress.to_hex(4)
            
            
            if getA == 0 
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            #setPC(targetAddress)
            
            outcome = [targetAddress,"relative","conditional","" ] 
            return outcome 
        end 
        

        def doBNEQZ( executionList , operand  )

            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec

            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
                
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            

            
            if getA != 0 
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            
            #print "\nBNEQZ ",defaultTargetAddress.to_hex(4)," ",branchTargetAddress.to_hex(4)
            
            #Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 




        def doBPOS( executionList , operand  )

            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec

            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
                
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            

            
            if ( (  getA & 128 ) == 0 )
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            
            #print "\nBPOS ",defaultTargetAddress.to_hex(4)," ",branchTargetAddress.to_hex(4)
            
            #Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
       
         
         
        def doBNEG( executionList , operand  )

            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec

            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
                
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            

            
            if ( (  getA & 128 ) != 0 )
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            
            #print "\nBNEG ",defaultTargetAddress.to_hex(4)," ",branchTargetAddress.to_hex(4)
            
            #Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
        
         
        def doBXEQZ( executionList , operand  )
            
            print "\nERROR: BXEQZ not implemented.\n\n" ;
          
            Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
        
        
        def doBXNEQZ( executionList , operand  )
        
        
            #print "\nBXNEQZ ",executionList," ",operand

            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec

            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
            
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            

            
            if ( getX != 0 )
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            
            #print "\nBXNEQZ ",defaultTargetAddress.to_hex(4)," ",branchTargetAddress.to_hex(4)
            
            #Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
        
        
       
        def doBYEQZ( executionList , operand  )
            
            
             print "\nERROR: BYEQZ not implemented.\n\n" ;
          
            Process.exit(0)

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
        

        
        def doBYNEQZ( executionList , operand  )

            defaultTargetAddress = $address + executionList[1].to_i + 1 
            
            jump = operand.hex_to_dec

            if ( jump > 127 )
                
                branchTargetAddress = defaultTargetAddress - ( 255 - jump )
            
            else
            
                branchTargetAddress = defaultTargetAddress + jump
                
            end
            

            
            if ( getY != 0 )
                
                targetAddress = branchTargetAddress
                
            else
                
                targetAddress = defaultTargetAddress
                
            end
            
            

            outcome = [targetAddress,"relative","conditional","" ] 
            
            return outcome 
        end 
        
        
       
        
        
        
        
   
       
        
        def doDXSZ( executionList , operand  )  ; print "\nERROR: DXSZ not implemented.\n\n" ; Process.exit(0); outcome = ["DE","AD","BE","EF" ] ; return outcome ;  end ;
         
         
                  
        def doJMPR( executionList , operand  )

            #targetAddress = operand.hex_to_dec
            
            operandI = operand.hex_to_dec
            
            if ( operandI > 127 )
                
                offset = 127 - ( operandI & 127 ) 
                
                #print "\ntop offset = ",offset
                
                targetAddress = $address - offset
                
                #print "\ntop target  = ",targetAddress.to_hex(4)
                
            else
                
                offset = ( operandI & 127 )
                
                #print "\nbottom offset = ",offset
                
                targetAddress = $address + offset
                
            end
            
            
        
            #print "\naddress was ",$address.to_hex(4)
            
            #print "\nthe target address is ",targetAddress.to_hex(4)
            
            outcome = [targetAddress,"absolute","",""] ; 
            
            
            
            return outcome 

        end
         
        def doJMPA( executionList , operand  )
            
            #print "\njmpa ",executionList," ",operand
            
            #targetAddress = $address + executionList[1].to_i + 1
            
            targetAddress = operand.hex_to_dec
            
            outcome = [targetAddress,"absolute","",""] ; 
            
            #Process.exit(0)
            
            return outcome 

        end
         
         
         
         
         
        
        def doPUSHA( executionList , operand  )  

            $stack.push( getA )
            
            setSP(getSP - 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end  


        def doPUSHX( executionList , operand  )  

            $stack.push( getX )
            
            setSP(getSP - 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
        
        def doPUSHY( executionList , operand  )  

            $stack.push( getY )
            
            setSP(getSP - 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
         
         
        def doPUSHF( executionList , operand  )  

            $stack.push( getF )
            
            setSP(getSP - 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
         
         
        def doPUSHPC( executionList , operand  )  

            $stack.push( getPC )
            
            setSP(getSP - 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end  
         
        
         

         
                  
        def doPOPA( executionList , operand  )  

            setA( $stack.pop )

            setSP(getSP + 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
        
                   
        def doPOPX( executionList , operand  )  

            setX( $stack.pop )

            setSP(getSP + 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end        
        
                          
        def doPOPY( executionList , operand  )  

            setY( $stack.pop )

            setSP(getSP + 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
        
        
        def doPOPF( executionList , operand  )  

            setF( $stack.pop )

            setSP(getSP + 1)

            targetAddress = $address + executionList[1].to_i + 1 ;
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
        
                
        def doPOPPC( executionList , operand  )  

            setPC( $stack.pop + 1 )

            setSP(getSP)

            #targetAddress = $address + executionList[1].to_i + 1 ;
            
            targetAddress = getPC # resume at the NEXT instruction
            
            outcome = [targetAddress,"implied","",""] ; 
    
            return outcome 

        end 
         

         
      
         
         
        def doLDAI( executionList , operand  )
             
            #print "\n\n", executionList ," ",operand
            
            setA(operand.hex_to_dec)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"immediate","",""] ; 
    
            return outcome
            
        end 
         
         
         
         
         
        def doLDA( executionList , operand  )  
             
            #print "\n",executionList," ",operand 
             
             
            contents = $m.read(operand.hex_to_dec) 

            setA(contents)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
        end 
         
        def doLDAIX( executionList , operand  )  
             
            #print "\n",executionList," ",operand 
             
            contents = $m.read(operand.hex_to_dec + getX ) 

            setA(contents)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"indexed","",""] ; 
    
            return outcome
            
        end  
         
        def doLDAII( executionList , operand  )  
             
            #print "\n",executionList," ",operand 
             
            #contents = $m.read(operand.hex_to_dec + getX ) 
            
            indirectAddress = $m.read(operand.hex_to_dec)
            
            contents = $m.read(indirectAddress ) 
        
            setA(contents)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"indexed","",""] ; 
    
            return outcome
            
        end  
    
         
        def doLDXI( executionList , operand  )

            setX(operand.hex_to_dec)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"immediate","",""] ; 
    
            return outcome
            
        end     
         
        
        def doLDX( executionList , operand  )  

            contents = $m.read(operand.hex_to_dec) 

            setX(contents)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
        end  
        
        def doLDYI( executionList , operand  )

            setY(operand.hex_to_dec)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"immediate","",""] ; 
    
            return outcome
            
          end 
        
        
         
        def doLDY( executionList , operand  )  

            contents = $m.read(operand.hex_to_dec) 

            setY(contents)
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
         end        
         

    
         
         
        def doSTA( executionList , operand  )  

            $m.write(operand.hex_to_dec,getA) 
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
        end 
         
           
        def doSTAIX( executionList , operand  )  

            $m.write( ( operand.hex_to_dec + getX ) ,getA) 
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"indexed","",""] ; 
    
            return outcome
            
        end        
         
         
         
         
         
         
       
        def doSTAII( executionList , operand  ) 
             
            indirectAddress = $m.read(operand.hex_to_dec)
            
            $m.write(indirectAddress,getA)

            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"indirect","",""] ; 
    
            return outcome
            
        end        
         
         
        def doSTX( executionList , operand  )  

            $m.write(operand.hex_to_dec,getX) 
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
        end 
        
        def doSTY( executionList , operand  )  

            $m.write(operand.hex_to_dec,getY) 
            
            targetAddress = $address + executionList[1].to_i + 1
            
            outcome = [targetAddress,"absolute","",""] ; 
    
            return outcome
            
        end 
         
         
         

        def doINCA( executionList , operand  ); setA(getA + 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doINCX( executionList , operand  ); setX(getX + 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doINCY( executionList , operand  ); setY(getY + 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doDECA( executionList , operand  ); setA(getA - 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doDECX( executionList , operand  ); setX(getX - 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doDECY( executionList , operand  ); setY(getY - 1 ); targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end 
        def doTAX( executionList , operand  )  ;  setX(getA)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doTAY( executionList , operand  )  ;  setY(getA)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doTXA( executionList , operand  )  ;  setA(getX)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doTYA( executionList , operand  )  ;  setA(getY)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doTXY( executionList , operand  )  ;  setY(getX)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doTYX( executionList , operand  )  ;  setX(getY)         ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end        
        def doAND( executionList , operand  ) ; setA( getA & operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doOR( executionList , operand   ) ; setA( getA | operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doNOT( executionList , operand  ) ; setA( ~ getA )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doXOR( executionList , operand  ) ; setA( getA ^ operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doLSL( executionList , operand  ) ; setA( getA << operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doLSR( executionList , operand  ) ; setA( getA >> operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doADD( executionList , operand  ) ; setA( getA + operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doSUB( executionList , operand  ) ; setA( getA - operand.hex_to_dec )        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
        def doCLC( executionList , operand  ) ; setC(0)        ; targetAddress = $address + executionList[1].to_i + 1; outcome = [targetAddress,"implied","",""] ; return outcome ; end
                                                         



end # of class CPU