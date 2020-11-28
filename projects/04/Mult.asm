// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.



	// store n = R1
	@R1
	D=M
	@n
	M=D    

	// i = 1 
	@i
	M=1 

	// prod = 0
	@prod
	M=0


(LOOP)
	@i
	D=M
	@n
	D=D-M
	@STOP
	D; JGT  // if i > n stop (i.e. R0*R1 done)

	@prod
	D=M
	@R0
	D=D+M
	@prod
	M=D     // prod = prod + R0

	@i
	M=M+1   // i = i + 1
	@LOOP
	0;JMP

(STOP)
	@prod
	D=M
	@R2
	M=D    // R2 = product

// Terminate
(END)
	@END
	0; JMP