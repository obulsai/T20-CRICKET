`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:23:42 AM
// Design Name: 
// Module Name: bcdDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module bcdDisplay(
    input clk_fpga,                // master clock 100MHz
    input [7:0] binaryruns,        // runs from cricket game
    input [3:0] binarywickets,     // wickets from cricket game
    input inningOver,             // show 10 on the display
    input gameOver,               // signals the end of the game
    input winner,                 // locked in winner of the game
    output [3:0] an,              // drives the anodes
    output dp,                    // decimal point on display
    output [6:0] ca              // drives the seven-segment cathodes
);

wire clk_1kHz;                     // 1kHz clock signal from slowClock_1kHz module
wire [3:0] q;               // output of mux to display a specific seven segment parameter
wire [1:0] y;           // output of the 2-bit counter to the mux and decoder
wire [3:0] wickets, ones, tens, hundreds; // BCD output from converter to mux

// Binary to BCD converter
binary_to_BCD b1(
    binaryruns, binarywickets, inningOver, gameOver, winner, 
    wickets, ones, tens, hundreds
);

// Generate a 1kHz clock from the 100MHz master clock
slowClock_1kHz b2(clk_fpga, clk_1kHz);

// 2-bit counter at 1kHz for refreshing anodes
two_bit_counter b3(clk_1kHz,y);

// Turn on one anode and turn off the other three on each 1kHz tick of the 2-bit counter
decoder2to4 b4(y, dp, an);

// Select a BCD digit to display on the anode that is turned on
mux4to1 b5(y, wickets, ones, tens, hundreds, q);

// Display the digit selected by the mux using an equivalent 7-bit constant
display b6(q, ca);

endmodule
