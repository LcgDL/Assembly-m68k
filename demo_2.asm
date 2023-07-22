movi r0, 10
lsli r0, 4    #r0=160
addi r0, 13
lsli r0, 4    #173*16 = 2768
addi r0, 9		
lsli r0, 4    #2777*16 = 44432
movi r1, 14
lsli r1, 4    #r1=224
addi r1, 11
lsli r1, 4    #235*16 = 3760
addi r1, 6
lsli r1, 4    #3766*16= 60256
xor r0, r1    #r0: 44432 = 1010110110010000
	      #r1: 60256 = 1110101101100000
	      #      xor = 0100011011110000  => r0: 18160
not r0        #	     not = 1011100100001111  => r0: 47375
subi r0,1
bseti r0, 0   #    bseti = 1011100100001111
andi r0, 2
halt
