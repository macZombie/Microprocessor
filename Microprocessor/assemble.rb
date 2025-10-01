# assemble.rb

#require 'erb'

require './lib/customFile.rb'
require './lib/extendString.rb'
require './lib/genericFunctions.rb'
require './lib/extendInt.rb'
require './lib/csvFile.rb'
require './lib/memory.rb'



#require './decoder.rb'

require './encodeInstruction.rb'





$inputFile
#$outputFile
$listFile


labels = Hash.new


BEGIN { print "\nINFO: Start of ",$PROGRAM_NAME }

    m = Memory.new(65536)
    
    address  = 0
   
    startAddress = 0
    
   # print "\nmemory size is ",m.size
    
    #m.dump


    inputFileName = parseArguments
    
    outputFileName = inputFileName.sub(".asm",".hex")

    listFileName = inputFileName.sub(".asm",".lst")




    $inputFile = CustomFile.new(inputFileName,"assembly source code")
    
    $listFile = CustomFile.new(listFileName,"list file")
    
    $listFile.create
    
    $listFile.openWrite
    
    $listFile.write("# " + listFileName)


    # $outputFile = CustomFile.new(outputFileName,"hex machine code")
    
    # $outputFile.create
    
    
    labelPending = false
        
    for pass in ( 1 .. 2 )
        
        print "\nINFO: Pass number ",pass,"\n"
        
    #for pass in ( 1 .. 1 )

        $inputFile.openRead
  
        begin
    
            
            
            thisLabelString = ""
            
            
            inputString = $inputFile.getString
        
            if ( inputString != nil )
        
                inputString = inputString.strip
            
                inputList = inputString.split(" ")

            
                if ( inputList[0] == "//" )
                
                    $listFile.write(inputString)
                
                
                else
                
                    if ( inputList[0] == "address" )
                    
                        listString = "ADDRESS = " + inputList[1].to_s
                    
                        address = inputList[1].hex_to_dec
                        
                        startAddress = address
                        
                        
                        m.setAddress(address)
                        
                        print "\n",listString
                        
                        $listFile.write(listString)
                
                    else
                        
                         if ( inputList[0] == "fill" )
                             
                             print "\nFILL ",inputList[1], " bytes at address ",address.to_hex(4)," with ", inputList[2] 
                             
                             #stop = ( inputList[1].to_i  - 1 ) * 2 # because of that 8/16 bit hangover to be tidied up
                             
                            count = ( inputList[1].hex_to_dec ) - 1
                            
                            #print "\ncount = ",count
                            
                            start = address
                             
                            stop = address + count 
                             
                             for index in ( start .. stop )
                                 
                                 #print "\n",index," ",address + index, " " , ( address + index ) .to_hex(4)
                                 
                                 m.write(index,inputList[2].hex_to_dec  ) 
                                 
                             end
                             
                             
                        else
                
                        
                            firstWord = inputList[0]

                    
                   
                                if ( firstWord[0] == ":" )
                                    
                                labelPending = true
                                
                                thisLabel = firstWord
                                
                                #print "\nLABEL: ",firstWord," at address ",m.getAddress.toUHex4
                                
                                thisLabelString = "Label: " + firstWord + " at address " + m.getAddress.toUHex4
                                
                                labels[firstWord] = m.getAddress
                                
                                inputList = inputList[ 1 .. ( inputList.size - 1 ) ]
                                
                                #print "\ninput list is now ",inputList
                            
                            end
                    
                    
                    
                    
                        if ( ( pass == 2 ) && ( inputList.size >= 2 ) ) # possible jump to a label
                            
                            possibleLabel = inputList[1]
                            
                            
                            if ( possibleLabel[0] == ":" )
                            
                                #print "\npossibleLabel = ",possibleLabel
                                
                                resolvedAddress = labels[possibleLabel]
                                
                                #print "\nresolvedAddress = ",resolvedAddress.toUHex4
                                
                                inputList[1] = resolvedAddress.toUHex4
                                
                            end
                            
                                                            # print "\n",inputList," ",inputList.size
                            
                                                            #  thisLabelTarget = inputList[1]
                                                            #  
                                                            #  if (  thisLabelTarget[0] == ":" )
                                                            #       print "\n",thisLabelTarget
                                                            #  end
                            
                    
                        end
                
                
                

                    thisInstruction = inputList[0]
                    
                    result = encode(thisInstruction)  # uses encodeInstruction.rb
                    
                    if ( false )
                        print "\n\ninputList = ",inputList
                        print "\nresult = ",result
                    end
                    
                    
                    opCodeS = result[0].to_i
                    fetches = result[1].to_i
                    addressMode = result[2]
                    description = result[3]
                    
                  
                    if ( false )
                        print "\n",opCodeS = result[0].to_i
                        print "\n",fetches = result[1].to_i
                        print "\n",addressMode = result[2]
                        print "\n",description = result[3]
                    end
                    
                    if ( labelPending == true )
                        
                        labelString = thisLabel.ljust(9)
                        
                        labelPending = false
                        
                    else
                    
                        labelString = "        ".ljust(9)
                        
                    end
                    
                    address = m.getAddress
                    
                    addressS = address.to_hex(4)
                    
                    hexString = labelString + "[" + addressS.strip + "]"
                    
                    hexString = hexString.ljust(18)
                    
                    hexString = hexString + result[0].upcase.ljust(4)
                    
                    #print "\nhex = ",result[0].hex_to_dec
                    
                   
                    
                    m.writeIncrement(result[0].hex_to_dec)
                    
                    sourceString = inputList[0].ljust(8)
                    
                    
                    if ( fetches != 0 )
                        hexString = hexString + inputList[1]
                        sourceString = sourceString + inputList[1]
                        
                        #print "\nthe byte is ",inputList[1]
                        
                        if (  ( result[2] == "immediate" ) || ( result[2] == "relative" )  )
                            
                            #print "\nthe immediate byte is ",inputList[1]
                            m.writeIncrement(inputList[1].hex_to_dec)
                            
                        end
                        
                        
                        if (  ( result[2] == "absolute" ) || ( result[2] == "indexed" ) || ( result[2] == "indirect" )  )
                            
                            word = inputList[1]
                            
                            #print "\nthe absolute bytes are ",word
                            
                            msb = word[ 0 .. 1 ]
                            
                            lsb = word[ 2 .. 3 ]
                            
                            #print "\nthe absolute bytes are ",word," ",msb," ",lsb
                            
                            m.writeIncrement(msb.hex_to_dec)
                            m.writeIncrement(lsb.hex_to_dec)
                            
                            
                            #m.writeIncrement(inputList[1].hex_to_dec)
                            
                        end
                        
                        
                        
                        #m.writeIncrement(inputList[1].hex_to_dec)
                    else     
                        hexString = hexString + " "
                        sourceString = sourceString + " "
                    end
                    

                    
                    
                    #print "\nbytes = ",bytes
                    
                    hexString = hexString.ljust(32) + " | "
                    sourceString = sourceString.ljust(24) + " | "
                   
                    
                    descriptionString = description.ljust(64) + " | "
                    
                    
                    
                    print "\n",hexString,sourceString,descriptionString
                    
                    $listFile.write(hexString + sourceString + descriptionString)

                    firstAddress = m.getAddress # store the address of the 1st byte of the instruction
                
                    
                    
                

                 end
                end
            end    
            
            
        end
        



    end while ( inputString != nil )
    

    
    $inputFile.close
    
    print "\nEnd of pass ",pass,"\n\n\n"
    
    $listFile.write("\nEnd of pass " + pass.to_s + "\n\n\n")
    
end # of 1st and 2nd pass
    
    #####################################################
    #               BUFFER MEMORY TO HEX FILE
    #####################################################
    
    m.bufferToHexFile(outputFileName)
    
 #$outputFile.openWriteBinary
 # 
 #for index in (   0 .. ( m.getSize - 1)   )
 #    
 #    data = m.read(index)
#
 #    print "\n",index," ",data," ",data.class.to_s
 #    
 #    $outputFile.writeBinary(data)
 #    
 #end
 #
 #
 #
 #$outputFile.close
    
    #startAddress = 0
    stopAddress = m.getAddress
    
    print "\n"
    $listFile.write("\n")
    
    m.dumpBlock(startAddress,stopAddress - startAddress)
    
    
    print "\n\nLabels:\n"
    
    
    labels.each {|key, value| puts "#{key.ljust(8)} ---- #{value.toUHex4}" }
    
    
    $listFile.write("\n\n\nLabels:\n")
    
    labels.each {|key, value| $listFile.write("\t#{key.ljust(8)} ---- #{value.toUHex4}" )}
 
    $listFile.write("\n\n\n")
    
    

END { print "\n\nINFO: End of ",$PROGRAM_NAME,"\n\n" }


