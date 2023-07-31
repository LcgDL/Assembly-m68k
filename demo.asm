#SET NUMBERS IN MEMORY
#00 02
   #r9=1
movi r9, 1 
   #1*2^8 => r9=256
lsli r9, 8   
movi r8, 2
   #r9:MEM[256] = 2 
   #256-deci = 100-hex (MEM): 0x0100: 0002 0000 0000
   #(16 bit Group: 8bits-Adresse[256:00] _ 8bits-Value=02)
stw r8,r9
   #r5=2 <- MEM[256] = 2
ldw r5,r9

#00 0e
   #r7=1
movi r7, 1
   #1*2^8 => r7=256
lsli r7, 8
   #r7+2 => 258
addi r7,2
movi r6, 14
   #258-deci = 102-hex (MEM): 0x0100: 0002 000e 0000
   #(16 bit Group: 8bits-Adresse[258:00] _ 8bits-Value=0e)
stw r6,r7

#00 1f = 31
movi r10, 1
   #1*2^8 => r10=256
lsli r10, 8
   #r10=260
addi r10, 4v
movi r5, 1
   #1*2^5 => r5=32
lsli r5, 5
   #r5=31
subi r5, 1
   #260-deci = 104-hex (MEM): 0x0100: 0002 000e 001f
   #(16 bit Group: 8bits-Adresse[260:00] _ 8bits-Value=1f)
stw r5,r10

#Execution
   #r0=1
movi r0, 1
   #1*2^8 => r0=256
lsli r0, 8
   #r1=0 ; r2=0
movi r1, 0
movi r2, 0
   # r3=0 <- MEM[256] = 0
     # movi r9,9 
     # stw r9,r0
ldw r3, r0

loop:
   #?(r3[2]==r1[0])   
    #?(r3[1]==r1[0]) 
cmpeq r3, r1
bt end
   #(Pointer)r0=[258] => 14 (000e)
    #258-deci = 102-hex (MEM): 0x0100: 0002 000e 001f
     #(Pointer)r0=[260]...
addi r0, 2
   #r4=14 <= r0=[258]
ldw r4, r0
subi r3, 1
   #0+14
    #14+31
addu r2, r4
   #br -14 =-7(commands)*2
br loop

end:
   #r4=45
mov r4, r2
   #45=101101 (not change: set bit(1) in 2^0=1)
bseti r2, 0
   #r2=0
subu r2, r4
halt
