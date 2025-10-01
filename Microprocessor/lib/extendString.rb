#!/usr/bin/ruby

# extendString.rb

class String

        def suball(originalString,replacementString)
                
                outputString = self
                
                
                begin
                        
                        count = outputString.count(originalString)
                                
                        outputString = outputString.sub(originalString,replacementString)
                                 
                end while ( count > 0 )


                return outputString
                
        end
            
            
            
        def hex_to_dec
            
            string = self

            dec = string.to_i(16)
            
            return dec
            
        end
        
        
        def getCell(n)
            
            #print "\ngetCell ",self,"     n = ",n
            
            outputString = ""
            
            list = self.split(",")
            
            #print "\n",list
            
            len = list.size
            
            # print "\ngetCell ",self,"     n = ",n," len = ",len
            
            if ( n <= len )
                
                #outputString = list[n].strip! # remove trailing spaces...
                
                 outputString = list[n]
                
            else
            
                print "\nERROR: getCell string is ",len," long but searching for cell ",n
                
            end
            
            outputString = outputString.strip
            
            return outputString
            
        end
        
        
        
        
#        def getColumn(stringName)
#            
#            stringName
#            
#            print "\ngetting ",stringName
#
#           result = -1
#           
#           thisList = self.split(",")
#           
#           print "\nthisList = ",thisList
#           
#           result = thisList.find_index(stringName).to_s
#           
#           
#           result = thisList.index { |x| ['b', 'c'].include?(x) }
#           
#         # thisList.each do |i|
#         #     
#         #     i.strip!
#         #     
#         #     print "\n>",i,"<   >",stringName,"<"
#         #     
#         #     print "\n",stringName.eql?(i)
#         #     
#         #      print "\n",( stringName == i )
#         #     
#         #     if ( i.eql?(stringName) )
#         #         print "\n FOUND!"
#         #         
#         #     end
#               
#               
#        
#           
#           
#           
#           return result
#           
#       end
        

    
            
                

end ; # of class String
