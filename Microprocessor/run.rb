# buildDecoder.rb

require 'erb'

require './lib/customFile.rb'
require './lib/extendString.rb'
require './lib/genericFunctions.rb'
require './lib/extendInt.rb'
require './lib/csvFile.rb'

require './decoder.rb'



$inputFile
$outputFile
$debugFile
$codeFile








BEGIN { print "\nINFO: Start of ",$PROGRAM_NAME }


    inputFileName = parseArguments

    outputFileName = inputFileName.sub(".csv",".rb")

    debugFileName = inputFileName.sub(".csv",".deb")
    
    codeFileName = "decoder.rb"

    
    $inputFile = CsvFile.new(inputFileName)
    $outputFile = CustomFile.new(outputFileName,"output file")
    $debugFile = CustomFile.new(debugFileName,"debug file")
    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")



    $outputFile.create
    $outputFile.openWrite
    $outputFile.write("#" + outputFileName)


    $debugFile.create
    $debugFile.openWrite
    $debugFile.write("#" + debugFileName)


    $codeFile.create
    $codeFile.openWrite
    $codeFile.write("#" + codeFileName)

 
    deb("Input file is " + inputFileName)
  
    inputString =  $inputFile.getTopLine
    
    print "\n>",inputString,"<"
    
    inputList = inputString.split(",")
    
    
    
    
    instructionCol  = $inputFile.getColumn("instruction")
    addressModeCol  = $inputFile.getColumn("addressMode")
    extraFetchesCol = $inputFile.getColumn("extraFetches")
    indexCol        = $inputFile.getColumn("index")       
    opCodecol       = $inputFile.getColumn("opCode")      
    descriptionCol  = $inputFile.getColumn("description")  
    
    
    
    print "\ninstructionCol  =  ",  instructionCol  
    print "\naddressModeCol  =  ",  addressModeCol  
    print "\nextraFetchesCol =  ",  extraFetchesCol 
    print "\nindexCol        =  ",  indexCol        
    print "\nopCodecol       =  ",  opCodecol       
    print "\ndescriptionCol  =  ",  descriptionCol  
   
    
  
    
    templateA = ERB.new %q{def decode(instructionS)
   
    outputList = [ "XX" , "YY" , "ZZ" ,"QQ" ]
    
    case instructionS
    }

    codeString = templateA.result(binding)

    $codeFile.write(codeString)

    
    #Process.exit(0)
    
    $inputFile.openRead
    
    inputString = $inputFile.getString # skip top line
    
    
    begin
    
        
        

            
        inputString = $inputFile.getString
            
        
        if ( inputString != nil )
            
            inputString = inputString.strip!
            
            #print "\n",inputString
            
            inputList = inputString.split(",")
            
            #print "\n",inputList
            
            instruction   =  inputList[  instructionCol  ]
            addressMode   =  inputList[  addressModeCol  ]
            extraFetches  =  inputList[  extraFetchesCol ]
            index         =  inputList[  indexCol        ]
            opCode        =  inputList[  opCodecol       ]
            description   =  inputList[  descriptionCol  ]
            
            #code = index.to_i + 64 * extraFetches.to_i
            
            code = ( index.to_i & 63 ) | extraFetches.to_i << 6
            
            #print "\n",instruction.ljust(8)," ",index," ",extraFetches," ",code.to_s.ljust(4)," ",code.to_bin(8)," ",code.to_hex(2)
            
            print "\n",instruction.ljust(8)," ",extraFetches," ",code.to_s.ljust(4)," ",code.to_bin(8)," ",code.to_hex(2)
           
            stuff = 5 - instruction.size
            
            stuffing = ""
            
            for i in ( 0 .. stuff )
                
                stuffing = stuffing + " "
                
            end
            
            
            templateB = ERB.new %q{         when "<%=instruction%>" <%=stuffing%> then hexS = "<%=code.to_hex(2).strip%>" ; extraFetches = "<%=extraFetches%>" ; addressMode = "<%=addressMode%>" ; description = "<%=description.upcase%>" ;}

    codeString = templateB.result(binding)

    $codeFile.write(codeString)
            
        end

    end while ( inputString != nil )
    
    
    templateC = ERB.new %q{    
         else print "\nERROR: instruction ",instructionS," is not identified\n\n" ; Process.exit(0)
    
    end # of case
    
    outputList[0] = hexS
    outputList[1] = extraFetches
    outputList[2] = addressMode
    outputList[4] = description

    return outputList
    end    }

    codeString = templateC.result(binding)

    $codeFile.write(codeString)

    
    $codeFile.close
    
    $inputFile.close
    

    $outputFile.close
    #$codeFile.close
    $debugFile.close
    
    ##########################################################################################
    # At this point, we have a decode function to give the opcode, fetchCount and description 
    ##########################################################################################
   
   
   
    
    #print "\nHERE: ",decode("nop")
    #print "\nHERE: ",decode("sta")


END { print "\n\nINFO: End of ",$PROGRAM_NAME,"\n\n" }



