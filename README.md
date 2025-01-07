# Computer hardware
Software to check programs: (https://nand2tetris.github.io/web-ide/chip/)
## Overview
 This repository contains the details and codes for the project under the "Build a modern computer from first principles:From nand to tetris part 1" course on coursera. It contains hardware parts of a computer, begenning from basic logic gates upto CPU.
## The "HACK" Computer
It is the hardware of a computer of word size of 16-bit. The computer consists of: 
- CPU:ALU, Program counter(PC), A registers(which stores both address of registers and data) and D registers (which stores data)
- ROM32K: stores instructions. (Already provided)
- Memory: First 16K(for data), next 8K(for screen memory map), last 1 register (for keyboard memory map)
![1](https://github.com/user-attachments/assets/e65801a4-c970-47b3-ad0b-c0a70588cdfc)
## Chips
Some useful chips, which were built for this project:
1. Not16: 16-bit Not gate, negates a 16-bit word.
   - for i = 0, ..., 15:
   - out[i] = Not(a[i])
2. And16: 16-bit And gate, gives bitwise and of two 16-bit words.
   - for i = 0, ..., 15:
   - out[i] = a[i] And b[i]
3. Or16: 16-bit Or gate, gives bitwise or of two 16-bit words.
   - for i = 0, ..., 15:
   - out[i] = a[i] Or b[i]
4. Mux16: 16-bit multiplexer.
   - for i = 0, ..., 15:
   - if (sel = 0) out[i] = a[i], else out[i] = b[i]
6. Or8Way: Outputs the Or of all bits of a 8-bit word.
   - out=in[0] or in[1] or ... or in[7]
7. Mux4Way16:
   - out = a if sel = 00
   - b if sel = 01
   - c if sel = 10
   - d if sel = 11
8. Mux8Way16: Similar to Mux4Way16.
9. DMux4Way: 4-way demultiplexor
   - [a, b, c, d] = [in, 0, 0, 0] if sel = 00
   - [0, in, 0, 0] if sel = 01
   - [0, 0, in, 0] if sel = 10
   - [0, 0, 0, in] if sel = 11
10. DMux8Way: 8-way demultiplexor, similar to DMux4Way.
11. Add16: 16-bit adder. Adds two 16-bit two's complement values.
12. Inc16: 16-bit incrementer. Increases a 16 bit number by 1.

-*Slicing of word*:-
If arr is a 16-bit word then, we can slice it using the syntax:
- arr[i1..i2] where i1<i2.
## Instruction Encoding
![Reset](https://github.com/user-attachments/assets/81ec92cd-86d6-4020-a0a6-69071baacfa6)
The machine language used in this project consists of two types of instructions:
- The first bit of the instruction is "opcode".
- A instruction: Sets the A register to the specified value. opcode=0
- C instruction: Comutes the value of "comp", stores result in "dest". opcode=1
- if the boolean expression "comp" (for {comp;jump}) is true then jumps to execute instruction stored in ROM[A].
## ALU
Arithmetic Logic Unit. Computes out = one of the following functions:
- ( 0, 1, -1, x, y, !x, !y, -x, -y, x + 1, y + 1, x - 1, y - 1, x + y, x - y, y - x, x & y, x | y ) on the 16-bit inputs x, y.
According to the input bits zx, nx, zy, ny, f, no.
- if (zx == 1) sets x = 0        // 16-bit constant
- if (nx == 1) sets x = !x       // bitwise not
- if (zy == 1) sets y = 0        // 16-bit constant
- if (ny == 1) sets y = !y       // bitwise not
- if (f == 1)  sets out = x + y  // integer 2's complement addition
- if (f == 0)  sets out = x & y  // bitwise and
- if (no == 1) sets out = !out   // bitwise not
- *In addition, computes the two output bits:*
- if (out == 0) zr = 1, else zr = 0
- if (out < 0)  ng = 1, else ng = 0
![3](https://github.com/user-attachments/assets/7e5d76d0-16d0-4a13-a9aa-f25dc7fdc58d)
## Program counter
16-bit program counter implementation:
- if      reset(t): out(t+1) = 0
- else if load(t):  out(t+1) = in(t)
- else if inc(t):   out(t+1) = out(t) + 1
- else              out(t+1) = out(t)
![4](https://github.com/user-attachments/assets/bd38abfb-b918-4cf7-bb3c-3ccd11132db7)
## CPU
Parses the binary code in the instruction input and executes it according to the hack machine language specification. In the case of a C-instruction, computes the function specified by the instruction. If the instruction specifies to read a memory value, the inM input is expected to contain this value. If the instruction specifies to write a value to the memory, sets the outM output to this value, sets the addressM output to the target address, and asserts the writeM output (when writeM = 0, any value may appear in outM). If the reset input is 0, computes the address of the next instruction and sets the pc output to that value. If the reset input is 1, sets pc to 0.
![Reset](https://github.com/user-attachments/assets/ee4a0e00-c293-4853-b1e5-6e0b85b81daf)
