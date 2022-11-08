// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// 1. Store a copy of R0 (multiplicand) in R3
@0
D=M
@3
M=D

// 2. Initialize product to 0
@2
M=0

(LOOP)
    // 3. Decrement R1 (the multiplier) until it's zero
    @1
    D=M-1 // D = R1 - 1
    M=D

    // 4. If R1 is zero, done
    @END
    D;JEQ

    // 5. Increment R0 (multiplicand) by its original value (stored in R3)
    @3
    D=M
    @0
    M=M+D

    // 6. Loop back
    @LOOP
        0;JMP
(END)
    // 7. Store product in R2, infinitely loop
    @0
    D=M
    @2
    M=D
    @END
    0;JMP