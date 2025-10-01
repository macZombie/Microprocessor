class Integer



    
    
    def to_base(base,width)
        
        numberI = self
        
                
        if ( numberI < 0 )

            paddingString  = "-"
        
        else
            
            paddingString = " "
            
        end
       


        numberI = numberI.abs # now we've handled the sign, we don't care about it
        
        numberS = numberI.to_s(base)
        
        numberStringSize = numberS.size
        
       #print "\nBUG: numberStringSize is >",numberStringSize,"<"
       
    

        for i in ( 0 ..  ( width - numberStringSize - 1 )  ) do

            paddingString = paddingString + "0"

        end


        paddingString = paddingString + numberS


        return paddingString

    end  
    


    def to_bin(width)

        return to_base(2,width) 

    end  



    def to_hex(width)

        return to_base(16,width)

    end  
    
  
    def to_oct(width)

        return to_base(8,width)

    end  
    

    def toUHex2
    
        numberI = self
    
    
        if ( numberI >= 0 )
            
                if ( numberI < 16 )
            
                    result = "0" + numberI.to_s(16)
                    
                else
                    
                    result = numberI.to_s(16)
                    
                end
                
        else
            
            result = ( 256 - numberI.abs ).to_s(16) 
            
        end
        
        
        return result
    
    end



    def toUHex4
    
        numberI = self
        
        msb = numberI >> 8
    
        lsb = numberI & 255
    
        result = ""
        
        result = msb.toUHex2 +  lsb.toUHex2
    
        return result
    
    end
    
end # of class Integer


