movi r0, 10
lsli r0, 4
addi r0, 13
lsli r0, 4
addi r0, 9		
lsli r0, 4
movi r1, 14
lsli r1, 4
addi r1, 11
lsli r1, 4	
addi r1, 6
lsli r1, 4
xor r0, r1
not r0
subi r0,1
bseti r0, 0
andi r0, 2
halt
