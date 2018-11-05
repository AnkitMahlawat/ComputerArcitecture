
@this program will give correct output only when there is a input in lowercase alphabet and is a valid 
@16 bit hexadecimal number. Here I have implemented no procedure to check the correctness of input.
@also the name of input file must be in.txt. if input file is not found then a message will b printed 
@to standard out.the name of output file should be out.txt if not found will be genenrated automatically 
@and output will be written.

.equ SWI_PrChr,0x00
.equ SWI_Open,0x66
.equ SWI_Close,0x68
.equ SWI_Exit, 0x11
.equ SWI_RdStr, 0x6a
.equ SWI_PrStr, 0x69
.equ SWI_WrStrSout, 0x02
.text

infileopensection:
ldr r0,=InFileName
mov r1,#0 @ input mode
swi SWI_Open
bcs NoinFileFound
ldr r1,=InFileHandle
str r0,[r1]

rdstrsection:
ldr r0,=InFileHandle
ldr r0,[r0]
ldr r1,=CharArray
mov r2,#10
swi SWI_RdStr
bcs infileReadError

infileclosesection:
ldr r0,=InFileHandle
ldr r0,[r0]
swi SWI_Close

outfileopensection:
ldr r0,=OutFileName
mov r1,#1 @ output mode
swi SWI_Open
bcs NooutFileFound
ldr r1,=OutFileHandle
str r0,[r1]


pretogen:     @preparing to generate bit pattern by opening CharArray file where
mov r0,#0     @read input from file is saved
mov r2,#4
ldr r1,=CharArray

bitpttgen:
ldrb r0,[r1]
add r1,r1,#1
cmp r0,#'B'
blo intopsec
sub r0,r0,#'a'
add r0,r0,#10
b continue
intopsec:
sub r0,r0,#'0'
continue:
mov r4,r4,lsl #4
orr r4,r4,r0
subs r2,r2,#1
bne bitpttgen

mov r7,r4
mov r5,#5

while_loop:
mov r1,#1
and r0,r4,r1
mov r1,r1,lsl #2
and r3,r4,r1
mov r3,r3,lsr #2
eor r0,r3,r0
mov r1,r1,lsl #1
and r3,r4,r1
mov r3,r3,lsr #3
eor r0,r3,r0
mov r1,r1,lsl #2
and r3,r4,r1
mov r3,r3,lsr #5
eor r0,r3,r0
mov r4,r4,lsr #1
mov r0,r0,lsl #15
orr r4,r4,r0
ldr r2,=CharArray1
add r2,r2,#3
@mov r0,#'\n'
@str r0,[r2]
@sub r2,r2,#1

addstuff:
cmp r5,#1
blo escape
sub r5,r5,#1

mov r6,#4
mov r1,r4
mov r3,#15

printingstuff:
and r0,r3,r1
mov r1,r1,lsr #4
cmp r0,#10
blo intbackop
sub r0,r0,#10
add r0,r0,#'a'
b continue1
intbackop:
add r0,r0,#'0'
continue1:
strb r0,[r2]
sub r2,r2,#1
subs r6,r6,#1
bne printingstuff
ldr r0,=OutFileHandle
ldr r0,[r0]
ldr r1,=out
swi SWI_PrStr
ldr r1,=CharArray1
swi SWI_PrStr
ldr r1,=lfeed
swi SWI_PrStr

escape:
cmp r7,r4
bne while_loop

printingstufff:   @printing when final state = intial state = {in example case 0xace1u} 
ldr r0,=OutFileHandle
ldr r0,[r0]
ldr r1,=out1
swi SWI_PrStr
ldr r1,=CharArray
swi SWI_PrStr


outfileclosesection:
ldr r0,=OutFileHandle
ldr r0,[r0]
swi SWI_Close

b end  @no need to close input file twice

infileReadError:   @error reading from input file
ldr r0,=InFileHandle
ldr r0,[r0]
swi SWI_Close

swi SWI_Exit

NoinFileFound:
ldr r0,=InFileError
swi SWI_WrStrSout
b end
NooutFileFound:
ldr r0,=OutFileError
swi SWI_WrStrSout
end:
swi SWI_Exit
.data
lfeed: .asciz "\n"
out: .asciz "lfsr="
out1: .asciz "Post termination lfsr="
CharArray: .skip 10
CharArray1: .skip 20
InFileName: .asciz "in.txt"
InFileError: .asciz "Unable to open input file\n"
.align
InFileHandle: .word 0
OutFileName: .asciz "out.txt"
OutFileError: .asciz "Unable to open output file\n"
.align
OutFileHandle: .word 0
.end
