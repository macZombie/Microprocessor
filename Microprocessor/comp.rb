

class Integer




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



for x in ( -128 .. 127 ) do
    
    print "\n",x," ",x.toUHex2
    
end



print "\n",-32768.toUHex4


print "\n",-1.toUHex4
print "\n",0.toUHex4
print "\n",255.toUHex4
print "\n",256.toUHex4
print "\n",1024.toUHex4
print "\n",16384.toUHex4
print "\n",32767.toUHex4
    
    
    
    











