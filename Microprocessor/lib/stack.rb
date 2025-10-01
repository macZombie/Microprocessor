# stack.rb


class Stack < Array
    
    def push(value)
  
        super
        
        return
  
    end
    

    def pop
        
        #print "\npop has been called"
        
        #print "\nabout to pop"
        
        depth = self.size
        
        #print "\ndepth = ",depth
        
        if ( depth < 1 )
            
            print "\nERROR: return stack underflow ...perhaps a return without a call or more pops than pushes\n\n"
            
            Process.exit(0)
            
            
        end
        
        
        value = super
        
       # print "\npopped ",value.to_hex(4)
        
        return value
    end
    

    def show
        
        #print "\nsize = ",self.size
        
        print "\n\nStack:"
        
        info = "Top >"
        
        for index in ( ( size - 1) .. 0   ).step( -1 )
            
            print "\n",info,"ix = ",index," value = ",self[index]
            
            
            info = "     "
            
        end
        
        
        
        
    end
    





end # of class Stack