// Load x (R0) into D
@R0
D=M

// Load y (R1) into A, then compute x OR y
@R1
D=D|M  // D = R0 OR R1

// Store x OR y in R3 (temporary)
@R3
M=D

// Load x (R0) into D again
@R0
D=M

// Load y (R1) into A, then compute x AND y
@R1
D=D&M  // D = R0 AND R1

// Compute NOT (x AND y)
D=!D

// Store NOT (x AND y) in R4 (temporary)
@R4
M=D

// Compute (x OR y) AND NOT(x AND y), which is x XOR y
@R3
D=M

@R4
D=D&M  // D = (R0 OR R1) AND NOT (R0 AND R1)

// Store result in R2
@R2
M=D

// End program
(END)
@END
0;JMP