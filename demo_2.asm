movi r0, 10
lsli r0, 4    #r0=160
addi r0, 13
lsli r0, 4    #173*16 = 2768
addi r0, 9		
lsli r0, 4    #2777*16 = 44432
movi r1, 14
lsli r1, 4    #r1=224
addi r1, 11
lsli r1, 4#235*16 = 3760
addi r1, 6
lsli r1, 4    #3766*16= 60256
xor r0, r1    
not r0
subi r0,1
bseti r0, 0
andi r0, 2
halt
