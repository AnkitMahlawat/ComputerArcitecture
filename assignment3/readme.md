# Problem Statement
1. Parse the given an ARM assembly program and use an appropriate representation to store it in an array, with each array element representing an instruction.

2. Resolve the addresses of the labels

3. Simulation starts with the Program Counter (PC) pointing to the first instruction.

4. Execute the instruction. Display the values of the Register File and Memory contents as a result of executing the instruction.

5. Proceed to the next instruction and continue the execution.

6. Simulation stops when there is no further instruction to execute.

At the end of execution, report any interesting statistics regarding the number and types of instructions executed, etc.

Your program must support at least the following instructions.

LDR

STR

ADD

SUB

MUL

CMP

BNE

BGE

B

BL

MOV

You need not implement ALL variations of the above instructions. Also, you can use Assignment 1 as a sample benchmark (by removing comments) for testing your simulator.

[OPTIONAL: Implement the simulation of other ARM instructions. Make appropriate assumptions.]
