// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
    @R0
    D=M
    @num1
    M=D

    @R1
    D=M
    @num2
    M=D

    @R2
    M=0

(LOOP)
    @num2
    D=M
    @END
    D;JEQ

    @num1
    D=M
    @R2
    M=D+M
    @num2
    D=M-1
    @num2
    M=D
    @LOOP
    0;JEQ

(END)
    @END
    0;JMP
