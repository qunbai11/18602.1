// Load x from R0
@R0
D=M

// Check if x is negative by checking the most significant bit
@NEGATIVE
D;JLT  // Jump if x < 0

// If x is positive or zero, store x in R1, set R2 to 0, and R3 to 0
@R1
M=D
@R2
M=0
@R3
M=0
@END
0;JMP

(NEGATIVE)
// If x is negative, store 1 in R2
@R2
M=1

// Check for the special case where x = -32768 (binary: 1000000000000000)
@R0
D=M
@32768
D=D+A  // If x + 32768 == 0, then x is -32768
@SPECIAL_CASE
D;JEQ

// If x is not -32768, compute -x using two’s complement (~x + 1)
@R0
D=M
D=-D  // Two's complement: negate x
@R1
M=D

// Set R3 to 0 since the absolute value was computed successfully
@R3
M=0
@END
0;JMP

(SPECIAL_CASE)
// If x is -32768, copy x to R1 and set R3 to 1
@R0
D=M
@R1
M=D
@R3
M=1

(END)
@END
0;JMP