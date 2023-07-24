# Set numbers in memory
#00 002
movi r9, 1 
#1*2^8 => r9=256
lsli r9, 8   
movi r8, 2
stw r8,r9
#00 0e
movi r7, 1
lsli r7, 8
addi r7,2
movi r6, 14
stw r6,r7
#00 1f = 31
movi r10, 1
lsli r10, 8
addi r10, 4
movi r5, 1
lsli r5, 5
subi r5, 1
stw r5,r10

#Execution
movi r0, 1
lsli r0, 8
movi r1, 0
movi r2, 0
ldw r3, r0

loop:
cmpeq r3, r1
bt end

addi r0, 2 
ldw r4, r0
subi r3, 1
addu r2, r4
br loop

end:
mov r4, r2
bseti r2, 0
subu r2, r4
halt
