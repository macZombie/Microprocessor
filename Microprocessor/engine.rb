# engine.rb


#require 'erb'

require './lib/customFile.rb'
require './lib/extendString.rb'
require './lib/genericFunctions.rb'
require './lib/extendInt.rb'
require './lib/cpu.rb'
require './lib/memory.rb'
require './decoder.rb'
require './lib/stack.rb'


require './decodeInstruction.rb'



$inputFile
$listFile



$address # this really needs to be global



#$m = Memory.new(65536)
$m

$stack = Stack.new

$brk


BEGIN { print "\nINFO: Start of ",$PROGRAM_NAME }

   $brk = false

    inputFileName = parseArguments

    listFileName = inputFileName.sub(".hex",".tron")

  



    $inputFile = File.new(inputFileName)
    
    $listFile = CustomFile.new(listFileName,"machine code trace file")
    
    $listFile.create
    
    $listFile.openWrite
    
    $listFile.write("# " + listFileName)

 ######################################################################


   $m  = Memory.new(65536)

   $inputFile = File.new(inputFileName)
    
   File.open $inputFile,"r"
 
 
 
    begin
    
        inputString = $inputFile.gets
        
        if ( inputString != nil )
            
            inputList = inputString.split(" ")
            
            addressS = inputList[0]
            
            dataS = inputList[1]
            
            addressD = addressS.hex_to_dec
            
            dataD = dataS.hex_to_dec
            
            
            $m.write(addressD,dataD)
            
            #print "\n",addressS," ",dataS," ",addressD," ",dataD
            

        end # not == nil
        
    end while ( inputString != nil )
    
    
    $inputFile.close
    
  
    #Process.exit(0)
  


   
   ######################################################################

    # The machine-code is now in RAM - m Object of class Memory 64K deep
    
    #   m.dump
    
    cpu = CPU.new
    
    print "\n   ",cpu.getHeader
    print "\n",cpu.getStatus," <---<<< power on"

    
    
    #   $listFile.write("\n\n\n\n")
    #   $listFile.write("   " + cpu.getHeader)
    #   $listFile.write(cpu.getStatus + " <---<<< power on" )
    
    cpu.hardReset
    
    
    
    print "\n",cpu.getStatus," <---<<< reset"

    # $listFile.write(cpu.getStatus + " <---<<< reset" )

    print "\n\n\n\n\n"

    # $listFile.write("\n\n" + cpu.getMachineCodeHeader + cpu.getHeader)
    
    print "\n ".ljust(83), + cpu.getHeader
    
    cpu.run
    
    $inputFile.close

    print "\n\n\n\n\n"
    
    $listFile.write("\n")
    
    $m.dumpBlock("0000".hex_to_dec.to_i,64)
    
    $listFile.close
    


    

END { print "\n\nINFO: End of ",$PROGRAM_NAME,"\n\n" }
