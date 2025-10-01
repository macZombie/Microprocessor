address 0000
nop 
jmp 0020
nop
nop
nop
nop 
lda# DE
ldb# AD
ret
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
lda# 55
ldb# AA
ldx# FF
call 0008
nop
nop 
lda# 01
beqz 06
deca
beqz 06
nop
nop
nop
nop
nop
nop
bneqz 06
inca 
bneqz 06
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
nop
nop
nop
lda# 80
bpos 06
deca
bpos 06
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
nop 
nop
nop
nop
bneg 06
inca
bneg 06
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
nop
nop
nop
nop
nop
ldx# 01
bxeqz 06
decx
bxeqz 06
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
ldx# 04
dxsz
dxsz
dxsz
dxsz
dxsz
dxsz
dxsz
dxsz
nop 
nop
nop
nop
nop
jmp# 06 
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
jmp 00bb
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
brk // the end
// the very end
