#Dot product: (1*3)+(2*4)
#Place for the vector values: r0=120
#r0=120
movi r0,1
lsli r0,7
subi r0,8

#Write vector values to memory
#Values: 1,2,3,4
movi r1,1
stw r1,r0,0
movi r1,2
stw r1,r0,1
movi r1,3
stw r1,r0,2
movi r1,4
stw r1,r0,3

#Pointer
bseti r14,7
subi r14,8

#Take values from memory for mult.:(1*3)
ldw r1,r14,0
ldw r2,r14,2
call mull

mov r3, r0

#Take values from memory for mult.:(2*4)
ldw r1,r14,1
ldw r2,r14,3
call mull

addu r0,r3
# Result r0=11 (3+8)
halt

#Function
mull:
movi r0,0
movi r10,0

while:
cmpne r2,r10
bf ende

mov r9,r2
andi r9,1
cmpeq r9,r10
bf else
lsli r1,1
lsri r2,1
br while

else:
addu r0,r1
lsli r1,1
lsri r2,1
br while

ende:
# Result: r0=11
jmp r15 
