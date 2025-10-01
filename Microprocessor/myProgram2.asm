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
nop
nop 
nop
ldx# ff
dxsz
jmp# ff
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
