// test.asm
nop // this is a good ideA 
address 0001 // this is mandatory
nop
nop
nop
nop
jmpa  :gamma
nop
nop
nop
:alpha ldai 01
ldai 07
ldxi 09
ldyi 09
ret
nop
nop
nop
nop
jmpa :gamma
nop
nop
nop
nop
nop
nop
nop
:beta ldai 02
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
brk
nop
:gamma ldai 01
ldxi 02
ldyi 03
nop
call :alpha
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
:delta ldai 04
nop
ldyi 02
ldxi 02
decx
bxneqz fc
decy
byneqz f7
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
brk