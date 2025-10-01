// this is a comment
address 0000
nop // this is a comment
nop
nop
lda# 01  // load 1
ldb# 02 // load 2
ldx# 03 // load 3
nop
sta 0100
stb 0101
stx 0102
nop    
// rst       
//  call   
//  ret   
//  reti   
//  beqz   
//  bneqz  
//  bpos   
//  bneg   
//  bxeqz  
//  bxneqz 
//  dxsz   
//  jmp#   
//  jmp    
//  pusha  
//  pushb  
//  pushx  
//  pushf  
//  pushpc 
//  popa   
//  popb   
//  popx   
//  popf   
//  poppc  
lda# AA   
lda   0102 
// ldaix  
// ldai   
ldb# 55  
ldb  0101    
//  ldbix  
ldx# AA   
ldx 0100 
// nop
lda# 00
ldx# 02
ldaix 0100
lda# 55
ldx# 01
staix 0100
nop
lda# 01
sta 0120
lda# 10 
sta 0121
lda# AA
staii 0120 
nop
lda# 00
ldai 0120
nop
lda# 00
ldb# 10
ldx# 20
inca
incb
incx
deca
decb
decx
nop
lda# 33
ldb# 44
ldx# 55
tab
tax
lda# 33
ldb# 44
ldx# 55
tba
tbx
lda# 33
ldb# 44
ldx# 55
txa
txb
nop
lda# 33
ldb# 77
and
lda# 33
ldb# 77
or
lda# AA
not
lda# 10
ldb# 01
xor
lda# 01
lsl 1
lda# 80
lsr 1
lda# 05
ldb# 03
add
lda# 05
ldb# 03
sub
nop
lda# 00
not
not
nop
lda# 55
not
not
nop
lda# AA
not
not
nop
lda# ff
not
not
nop
lda# 55
out
lda# AA
out
nop
in
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
// ret 
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
// call 00b0
nop
nop
nop
nop
nop
brk // the end
// the very end
