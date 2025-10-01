# buildDecoder.rb

require 'erb'

require './lib/customFile.rb'
require './lib/extendString.rb'
require './lib/genericFunctions.rb'
require './lib/extendInt.rb'
require './lib/csvFile.rb'

#require './decoder.rb'



$inputFile
$outputFile
$debugFile
$codeFile








BEGIN { print "\nINFO: Start of ",$PROGRAM_NAME }


    labs = [":zero", ":one" ,":two",":three",":four",":five",":six",":seven",":eight",":nine",":ten",":eleven",":twelve"]


    inputFileName = parseArguments
 
    codeFileName = "encodeInstruction.rb"
    
    print "\nINFO: Generating ",codeFileName
    
    
    $inputFile = CsvFile.new(inputFileName)

    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("#" + codeFileName)


    inputString =  $inputFile.getTopLine
    
    inputList = inputString.split(",")
    
    
    instructionCol  = $inputFile.getColumn("instruction")
    addressModeCol  = $inputFile.getColumn("addressMode")
    extraFetchesCol = $inputFile.getColumn("extraFetches")
    indexCol        = $inputFile.getColumn("index")       
    opCodecol       = $inputFile.getColumn("opCode")      
    descriptionCol  = $inputFile.getColumn("description")  
    

    templateA = ERB.new %q{def encode(instructionS)
   
    outputList = [ "XX" , "YY" , "ZZ" ,"QQ" ]
    
    case instructionS
    }

    codeString = templateA.result(binding)

    $codeFile.write(codeString)
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
  


    
    begin
    
            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            #print inputString
            
            inputString = inputString.strip!
             
            if ( inputString != nil ) 
             
                inputList = inputString.split(",")
                
            end

            
            instruction   =  inputList[  instructionCol  ].strip
            addressMode   =  inputList[  addressModeCol  ]
            extraFetches  =  inputList[  extraFetchesCol ]
            index         =  inputList[  indexCol        ]
            opCode        =  inputList[  opCodecol       ]
            description   =  inputList[  descriptionCol  ]
            

            #code = ( index.to_i & 63 ) | extraFetches.to_i << 6
            
            code = index.to_i 

            stuff = 5 - instruction.size
            
            stuffing = ""
            
            for i in ( 0 .. stuff )
                
                stuffing = stuffing + " "
                
            end
            
            
            templateB = ERB.new %q{         when "<%=instruction%>" <%=stuffing%> then hexS = "<%=code.to_hex(2).strip%>" ; extraFetches = "<%=extraFetches%>" ; addressMode = "<%=addressMode.ljust(16)%>" ; description = "<%=description.upcase%>" ;}

            codeString = templateB.result(binding)

            $codeFile.write(codeString)
            
        end

    end while ( inputString != nil )
    
    
    templateC = ERB.new %q{    
         else print "\nERROR: instruction ",instructionS," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = hexS.strip
    outputList[1] = extraFetches.strip
    outputList[2] = addressMode.strip
    outputList[3] = description.strip

    return outputList
    end    }

    codeString = templateC.result(binding)

    $codeFile.write(codeString)
    
    $inputFile.close
    
    $codeFile.close
    
    ###########################################################################################
    # End of encoder, now write the decoder
    ###########################################################################################
    
    codeFileName = "decodeInstruction.rb"
    
    print "\nINFO: Generating ",codeFileName
    
    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("#" + codeFileName)

    
    
     templateA = ERB.new %q{
     
     
def decode(instructionList)
   
    outputList = [ "aa" , "bb" , "cc" ,"dd" ]
    
    opCodeI = 99999;
    
    opCodeI = instructionList[0].to_int

    opCode = opCodeI.to_hex(2)


    if ( opCode[0] == " " )
        
        opCode = opCode[ 1 .. 2 ]
        
    end
 
    case opCode
    }

    codeString = templateA.result(binding)

    $codeFile.write(codeString)
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
  


    
    begin
    
            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            inputString = inputString.strip!
            
        if ( inputString != nil )
             
            inputList = inputString.split(",")
            
        end

            
            instruction   =  inputList[  instructionCol  ].strip
            addressMode   =  inputList[  addressModeCol  ]
            extraFetches  =  inputList[  extraFetchesCol ]
            index         =  inputList[  indexCol        ]
            opCode        =  inputList[  opCodecol       ]
            description   =  inputList[  descriptionCol  ]
            

           #print "\n",instruction  
           #print " ",addressMode   
           #print " ",extraFetches 
           #print " ",index         
           #print " ",opCode      
           #print " ",description 





            #code = ( index.to_i & 63 ) | extraFetches.to_i << 6
            
            code = index.to_i  
            
            codeS = code.to_hex(2).strip!

            stuff = 4 - codeS.size
            
            stuffing = ""
            
            for i in ( 0 .. stuff )
                
                stuffing = stuffing + " "
                
            end
            
            
            stuffA = 10 - instruction.size
            
            stuffingA = ""
            
            for i in ( 0 .. stuffA )
                
                stuffingA = stuffingA + " "
                
            end
            
            
            stuffB = 10 - addressMode.size
            
            stuffingB = ""
            
            for i in ( 0 .. stuffB )
                
                stuffingB = stuffingB + " "
                
            end
            
            
            
          #  templateB = ERB.new %q{         when "<%=instruction%>" <%=stuffing%> then hexS = "<%=code.to_hex(2).strip%>" ; extraFetches = "<%=extraFetches%>" ; addressMode = "<%=addressMode%>" <%=stuffingB%> ; description = "<%=description.upcase%>" ;}
          #
          #  codeString = templateB.result(binding)
          #
          #  $codeFile.write(codeString)
          
                
            templateB = ERB.new %q{         when "<%=codeS%>" <%=stuffing%> then mnemonic = "<%=instruction%>" <%=stuffingA%> ; extraFetches = "<%=extraFetches%>" ; addressMode = "<%=addressMode%>" <%=stuffingB%> ; description = "<%=description.upcase%>" ;}
          
            codeString = templateB.result(binding)
          
            $codeFile.write(codeString)
          
          
          
            
        end

    end while ( inputString != nil )
    
    
    templateC = ERB.new %q{    
         else print "\nERROR: opCode ",opCode," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = mnemonic
    outputList[1] = extraFetches
    outputList[2] = addressMode
    outputList[3] = description

    return outputList
    end    }

    codeString = templateC.result(binding)

    $codeFile.write(codeString)
    
    $codeFile.close
    
    
    ##########################################################################################
    # At this point, we have a decode function to give the opcode, fetchCount and description 
    ##########################################################################################

    
    # And now we need a big case construct
    
    codeFileName = "executor.rb"
    
    print "\nINFO: Generating ",codeFileName
    
    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("#" + codeFileName)
    
    
        
     templateA = ERB.new %q{
     

def execute(executionList,operand) 
  
    mnemonic = executionList[0]
        
    jump = 0
        
    case mnemonic
   

    }

    codeString = templateA.result(binding)

    $codeFile.write(codeString)
    
    
    
    
    
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
  


    
    begin
    
            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            inputString = inputString.strip!
            
            if ( inputString != nil )
             
                inputList = inputString.split(",")
                
            end
            
            #print "\n",inputList
            
            mnemonic = inputList[0].strip
            
            #mnemonic = mnemonic.strip!
            
            functionName = "do" + mnemonic.upcase 
            
            
            
            templateB = ERB.new %q{         when "<%=mnemonic%>"; outcome = <%=functionName%>(executionList , operand ) ; end ;}
          
            codeString = templateB.result(binding)
          
            $codeFile.write(codeString)
          

            
        end

    end while ( inputString != nil )
    
    
    
    
    

templateC = ERB.new %q{ 
                     
         else print "\nERROR: mnemonic >",mnemonic,"< not identified.\n\n" ; Process.exit(0) 

        end # of case
        
        return outcome
        
    end
    }

    codeString = templateC.result(binding)

    $codeFile.write(codeString)
            


   
  
    $codeFile.close
    
    ##########################################################################################
    # now generate empty shells of instruction execution functions
    ##########################################################################################


   # And now we need a big case construct
    
    codeFileName = "machineFunctions.rb"
    
    print "\nINFO: Generating ",codeFileName
    
    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("#" + codeFileName)
    
    
        
    
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
  


    
    begin
    
            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            inputString = inputString.strip!
            
            if ( inputString != nil )
             
                inputList = inputString.split(",")
                
            end
            
            #print "\n",inputList
            
            mnemonic = inputList[0].strip

            functionName = "do" + mnemonic.upcase 
            
            stuffB = 10 - mnemonic.size
            
            
             
            
            stuffingB = ""
            
            for i in ( 0 .. stuffB )
                
                stuffingB = stuffingB + " "
                
            end
            
            
            
            templateA = ERB.new %q{         def <%=functionName%>( executionList , operand  ) <%=stuffingB%> ; outcome = ["DE","AD","BE","EF" ] ; return outcome ;  end ;}
          
            codeString = templateA.result(binding)
          
            $codeFile.write(codeString)
          

            
        end

    end while ( inputString != nil )
    
    
    
    
    
    
    
    $codeFile.close
    
    
    
    # NOW MAKE A DUMMY .ASM FILE
    
    codeFileName = "test.asm"
    
    print "\nINFO: Generating ",codeFileName
    
    $codeFile = CustomFile.new(codeFileName,"automatically generated asm")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("// " + codeFileName)
    
    
    $codeFile.write("address 0000")
    
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
  

    lineNumber = 0
    
    begin
    
            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            inputString = inputString.strip!
            
            if ( inputString != nil )
             
                inputList = inputString.split(",")
                
            end
            
            #print "\n",inputList
            
            mnemonic = inputList[0].strip



            stuffB = 6 - mnemonic.size
            
            stuffingB = ""
            
            for i in ( 0 .. stuffB )
                
                stuffingB = stuffingB + " "
                
            end
            
            
            operA = ""
            operB = ""
            
            #if ( (inputList[2]to_i == 1 )
            #    
            #    operA = "FF"
            #    
            #    
            #end
            
                
            fetchesS = inputList[2]

            #print "\n",fetchesS," ",fetchesS.class.to_s
            
            fetches = fetchesS.to_i
            
            #print "\nfetches = ",fetches," ",fetches.class.to_s
            
            if ( fetches >= 1 )
                
                if ( inputList[1] == "absolute" )
                    operA = "55AA"
                end
                if ( inputList[1] == "relative")
                    operA = "0A"
                end
                if ( inputList[1] == "immediate")
                    operA = "0F"
                end
                if ( inputList[1] == "indexed" )
                    operA = "C0C0"
                end
                if ( inputList[1] == "indirect" )
                    operA = "D0D0"
                end
                
            
            end
        
        
            if ( ( lineNumber % 10 ) == 0 )
                
                index = lineNumber / 10
        
                label = labs[index]
                
                label = label.ljust(10)
                
            else
                
                label = ""
                
            end
            
            
           #label = label.ljust(10)
            
            
            
            templateA = ERB.new %q{<%=label%><%=mnemonic%><%=stuffingB%><%=operA%><%=operB%>}
          
            codeString = templateA.result(binding)
            

            if ( mnemonic != "brk" )
          
                $codeFile.write(codeString)
                
            end
          
            lineNumber = lineNumber + 1
            
        end

    end while ( inputString != nil )
    
    ( 0 .. 4 ).each do |index|
        
            $codeFile.write("jmpa " + labs[index])
            
    end
        
    
    
    $codeFile.write("brk")
    
    $codeFile.close
    
    
    

END { print "\nINFO: End of ",$PROGRAM_NAME,"\n\n" }



