instruction format:
.text

.data

.end
if .text, .data or .end are not found in programm then program will abort  
instruction should be in same case letter(i.e. uppercase or lowercase. Instruction like Add is not supported which is a mix of uppercase and lower case )
while different instructions can be in different case letter like SUB in uppercase and add in lowercase
instructions supported:-add,sub,mul,mov,mvn,ldr,str,and,orr,b,bl,bgt,bge,ble,bne,beq

format of instruction

1. ADD Rd, Rn, Rm | ADD Rd, Rn, #imm
2. SUB Rd, Rn, Rm | SUB Rd, Rn, #imm
3. AND Rd, Rn, Rm | AND Rd, Rn, #imm
4. ORR Rd, Rn, Rm | ORR Rd, Rn, #imm
5. MUL Rd, Rn, Rm | ORR Rd, Rn, #imm
6. CMP Rn, Rm | CMP Rn, #imm
7. MOV Rd, Rm | MOV Rd, #imm
8. MNV Rd, Rm | MNV RD, #imm

First format
1. LDR Rd [Rn, #imm]
2. STR Rd [Rn, #imm] 
Second format 
1. LDR Rd ,=#imm
2. STR Rd ,=#imm

In second format you can directly give address of load and store(though only within assigned space)

ldr is also supported in
LDR Rd , =aa
it is a temporary instruction not fully functional yet. 

Branch instructions:-
BEQ
BNE
BL
BLE
BGT
BGE
B

due to large size of data memory I have shown first 400 bytes but I have assigned 4000 bytes to data memory
