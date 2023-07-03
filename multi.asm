#r1 = 105
movi r1,6
lsli r1,4
addi r1,9
#r2 = 90
movi r2,6
lsli r2,4
subi r2,6
br mul

mul:
#Auxiliary register
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
halt
#result=9450
