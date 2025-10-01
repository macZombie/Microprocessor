address 0000
nop 
jmp :plonk
nop
nop
nop
nop
nop
nop
nop 
:zonk lda# de
ldb# ad
nop
nop
nop
nop 
nop
nop
:plonk lda# 55
nop
nop 
jmp :plank
nop
nop
nop
:plank nop 
nop
nop
:zip lda# ff
nop
nop
nop
ldx# 04
dxsz
jmp# FF
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
ldx# 06
dxsz
jmp# FF
nop
nop
nop
nop
nop
brk // the end
// the very end
