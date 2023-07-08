movi r4,0
subi r14,1

movi r10,0

movi r6,3
movi r7,5

call potenz
halt

potenz:
subi r14,2
stw r15,r14

cmpgt r7,r10
bf potenz_sonst

subi r7,1
call potenz

mov r2,r0
mov r1,r6

movi r0,0
solange:
cmpne r2,r10
bf potenz_ende
mov r9,r2
andi r9,1

cmpeq r9,r10
bf sonst
lsli r1,1
lsri r2,1
br solange

sonst:
addu r0,r1
lsli r1,1
lsri r2,1
br solange

potenz_sonst:
movi r0,1

potenz_ende:
ldw r15,r14
addi r14,2
jmp r15 
