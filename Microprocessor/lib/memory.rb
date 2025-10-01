#memory .rb


class Memory < Array

    @myMemory
    @mySize
    @myAddress


    def initialize(size)
    
        #print "\nsize is ",size
        
        @myMemory = Array.new( size , 0   )
        @mySize = @myMemory.size
        @myAddress = 0
    
          #print "\nsize is ",@myMemory.size
        
    
        return
        
    end
        

    def write(address,data)
        
        @myMemory[address] = data & 255
        
        return
        
    end
    
    
    def read(address)
        
        value = @myMemory[address].ord & 255
        
        return value
        
    end
    
    def setAddress(value)
        
        @myAddress = value
        
    end
    
    def getAddress
        
        value = @myAddress
        
        return value
        
    end
    
    def writeIncrement(value)
        
        address = getAddress
        
        write(address,value)
        
        address = address + 1
        
        setAddress(address)
        
    end
    
    
    def getSize
        
        value = @mySize
        
        return value
        
    end
    
    
    
	def dump
		
		dumpBlockWide(0,@mySize - 8)
        
        
        #dumpBlock(0,@mySize - 8)
	
		return

	end
	
	
	def dumpBlock( startAddress, numberOfBytes )
		
		
		#print "\nnumberOfBytes = ",numberOfBytes
		
		mod = numberOfBytes % 8
		
		#print "\nmod = ",mod
		
		if ( mod != 0 )
		
			adjustment = 8 - mod
		
			#print "\nadjustment = ",adjustment
		
			numberOfBytes = numberOfBytes + adjustment
		
			#print "\nnumberOfBytes = ",numberOfBytes
			
		end
		
		endAddress = startAddress + numberOfBytes 
		
		for address in ( startAddress .. endAddress  ).step(8)
			
			outputString = ""
			
			charBuffer = ""
			
			if ( address < 16 ) 
				outputString = outputString + "0"
			end
			
						
			if ( address < 255 ) 
				outputString = outputString + "0"
			end
			
			if ( address < 4096 ) 
				outputString = outputString + "0"
			end
			
			outputString = outputString + address.to_s(16)
			
			outputString = outputString + "    "
			

			for byte in ( 0 .. 7 )
				
				data = @myMemory[address + byte]
				
				if ( data != nil )
					
					if ( data < 16 )
						
						outputString = outputString + "0"
						
						
					end
					
				
					outputString = outputString + data.to_s(16) + " "
				
					if (  ( data >= 32 ) && ( data <= 126 )  )
				
						charBuffer = charBuffer + data.chr
					
					else
					
						charBuffer = charBuffer + "."
					
					end
				
				end
				

			end
			
			
			outputString = outputString + "        " + charBuffer
			
			print "\n",outputString
            
            $listFile.write(outputString)
			
		
		end
		
		return

	end
    
    
    def dumpBlockWide( startAddress, numberOfWords )
		
		

		mod = numberOfWords % 8



		if ( mod != 0 )
		
			adjustment = 8 - mod
		
			numberOfWords = numberOfWords + adjustment
		
		end
		
		endAddress = startAddress + numberOfWords
		
        
        
		for address in ( startAddress .. endAddress  ).step(8)
			
			outputString = ""
			
			charBuffer = ""
			
			outputString = outputString + "[" + address.to_hex(4).strip! + "]"
			
			outputString = outputString + "    "
			

			for word in ( 0 .. 7 )
				
				data = @myMemory[address + word]


				if ( data != nil )

                    
                    #outputString = outputString + data.to_hex(4) + " "
                    
                    outputString = outputString + data.to_hex(2) + " "
				
					if (  ( data >= 32 ) && ( data <= 126 )  )
				
						charBuffer = charBuffer + data.chr
					
					else
					
						charBuffer = charBuffer + "."
					
					end
				
				end
				

			end
			
			
			outputString = outputString + "        " + charBuffer
			
			print "\n",outputString
			
		
		end
		
		return

	end
    
    
    
    
    def OldbufferToHexFile(fileName)
        
        print "\nINFO: buffering to hex file"

      
        
        print "\nfileName = ",fileName
        
        start = 0
        
        stop = @mySize - 1
        
        print "\nstart stop = ",start," ",stop
        
        myFile = File.new(fileName, "wb")
        
        
        for i in  ( start .. stop ) do

            c = @myMemory[i]

            myFile.putc(c)
        
        end


        myFile.close

        return
        
    end
    
    
    
    def bufferToHexFile(fileName)
        
        print "\nINFO: buffering to non-binary hex file"

        print "\nfileName = ",fileName
        
        start = 0
        
        stop = @mySize - 1
        
        print "\nstart stop = ",start," ",stop
        
        myFile = File.new(fileName, "w")
        
        
        for i in  ( start .. stop ) do

            c = @myMemory[i]

            outputString = i.to_hex(4).strip + " " + c.to_hex(2)
            
            myFile.puts(outputString)
            
            #  print "\n",outputString
        
        end


        myFile.close

        return
        
    end
    
    
    
    

end # of class Memory
