# Computer hardware
## Overview
 This repository contains the details and codes for the project under the "Build a modern computer from first principles:From nand to tetris part 1" course on coursera. It contains hardware parts of a computer, begenning from basic logic gates upto CPU.
## The "HACK" Computer
It is the hardware of a computer of word size of 16-bit. The computer consists of: 
- CPU:ALU, Program counter(PC), A registers(which store both address of registers and data) and D registers (which store data)
- ROM32K: stores instructions. (Already provided)
- Memory: First 16K(storing data), next 8K(for screen memory map), last 1 register (for keyboard memory map)
## Some Chips
Some useful chips, which were built for this project:
1. Not16: 16-bit Not gate, negates a 16-bit word.
   -for i = 0, ..., 15:
   -out[i] = Not(a[i])
2. And16: 16-bit And gate, gives bitwise and of two 16-bit words.
   -for i = 0, ..., 15:
   -out[i] = a[i] And b[i]
3. Or16: 16-bit Or gate, gives bitwise or of two 16-bit words.
   -for i = 0, ..., 15:
   -out[i] = a[i] Or b[i]
4. Mux16: 16-bit multiplexer.
   -for i = 0, ..., 15:
   -if (sel = 0) out[i] = a[i], else out[i] = b[i]
6. Or8Way: Outputs the Or of all bits of a 8-bit word.
   -out=in[0] or in[1] or ... or in[7]
7. Mux4Way16:
   -out = a if sel = 00
         -b if sel = 01
         -c if sel = 10
         -d if sel = 11
8. Mux8Way16: Similar to Mux4Way16.
9. DMux4Way: 4-way demultiplexor
   -[a, b, c, d] = [in, 0, 0, 0] if sel = 00
                  -[0, in, 0, 0] if sel = 01
                  -[0, 0, in, 0] if sel = 10
                  -[0, 0, 0, in] if sel = 11
10. DMux8Way: 8-way demultiplexor, similar to DMux4Way.
11. Add16: 16-bit adder. Adds two 16-bit two's complement values.
12. Inc16: 16-bit incrementer. Increases a 16 bit number by 1.
## Instruction Encoding
