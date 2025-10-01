# compose.rb

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

    codeFileName = "composed.csv"
    
    $codeFile = CustomFile.new(codeFileName,"automatically generated ruby")

    $codeFile.create
   
    $codeFile.openWrite
    
    $codeFile.write("#" + codeFileName)
    
    
    controlInstructionList = [ "nop","rst","brk","ret","reti"]
    
    
    controlInstructionList.each do |instr|
        print "\n",instr
    end
    


   
    
  
    $codeFile.close

END { print "\n\nINFO: End of ",$PROGRAM_NAME,"\n\n" }



