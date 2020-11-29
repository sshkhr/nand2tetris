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


(START)
	@SCREEN
	D=A
	@addr
	M=D   // addr = base address of screen

(FILL)   // start filling loop by checking for key press
    @KBD 
    D=M
    @BLACK  // if key pressed jump to setting black
    D;JNE 

(WHITE) // Set white
    D=0
    @SET   // if key not pressed jump to setting white
    0;JMP

(BLACK) // Set black
    D=-1

(SET) 
    @addr
    A=M
    M=D   // Set the screen pixels using indirect addressing

    @addr
    M=M+1 // Increment the address to next screen bit

    @KBD  // Screen ends where keyboard starts
    D=A
    @addr
    D=D-M
    @START
    D;JLE // Restart if all of screen is filled

    @FILL
    0;JMP // Continue the fill screen loop