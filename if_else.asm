main:
movi r1, 10
movi r2, 13

cmplt r1,r2
bf sonst
subu r2,r1
mov r0,r2
halt

sonst:
subu r1,r2
mov r0,r1
halt  
