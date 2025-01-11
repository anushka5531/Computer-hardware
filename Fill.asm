// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


(LOOP)
    @SCREEN
    D=A
    @j
    M=D

    @KBD
    D=A
    @i
    D=D-M
    @END
    D;JEQ

    @KBD
    D=M
    @END
    D;JEQ

    @i
    D=M
    @n
    A=D
    M=-1
    @i
    M=M+1
    
    @LOOP
    0;JMP

(END)
    @SCREEN
    D=A
    @i
    M=D

    @KBD
    D=A
    @j
    D=D-M
    @LOOP
    D;JEQ

    @KBD
    D=M
    @LOOP
    D;JNE

    @j
    D=M
    @n
    A=D
    M=0
    @j
    D=M+1
    @j
    M=D
    
    @END
    0;JMP
