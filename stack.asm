#Pointer = 65536
movi r4,0
subi r14,1

#Help register
movi r10,0
#Basis - Exponent: 3^5 = 243 
movi r6,3
movi r7,5

call exponentiation 
halt

exponentiation:
#Set stack return address
subi r14,2
stw r15,r14

#If-condition
cmpgt r7,r10
bf exponentiation_else

#exponentiation(b,(e-1)) => b is unchanged
subi r7,1
call exponentiation 

mov r2,r0
mov r1,r6

# b*potenz(b,(e-1)) => 243 in r0
movi r0,0
while:
cmpne r2,r10
bf exponentiation_end
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

exponentiation_else:
movi r0,1

exponentiation_end:
ldw r15,r14
addi r14,2
jmp r15 
