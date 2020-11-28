// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@SCREEN
D=A
@addr
M=D   // addr = base address of screen


@8191
D=A
@n
M=D // n = size of screen 

(CHECK)

	@i
	M=0 // i = 0

	@KBD
	D=M    // D=0 means no key pressed, D=1 means key pressed

	@BLACK
	D; JNE  // Draw black screen if D=1

	@WHITE
	D; JEQ  // Draw black screen if D=0


(BLACK)

	// if (i==n) goto CHECK
	@i
	D=M
	@n
	D=D-M
	@CHECK
	D;JEQ

	// Screen[i] = -1
	@addr
	D=M
	@i
	A=D+M
	M=-1

	// i++
	@i
	M=M+1

	@BLACK
	0;JMP // loop BLACK


(WHITE)

	// if (i==n) goto CHECK
	@i
	D=M
	@n
	D=D-M
	@CHECK
	D;JEQ

	// Screen[i] = -1
	@addr
	D=M
	@i
	A=D+M
	M=0

	// i++
	@i
	M=M+1

	@WHITE
	0;JMP // loop WHITE


// Terminate
(END)
	@END
	0; JMP