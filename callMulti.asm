movi r1,10
movi r2,12
movi r3,5

br mul

continue:
addu r0,r3
halt

mul:
#Auxiliary registers
movi r0,0
movi r10,0

while:
cmpne r2,r10
bf end

mov r9,r2
andi r9,1
#if
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

end:
br weiter
