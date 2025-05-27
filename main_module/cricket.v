`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 11:02:22 AM
// Design Name: 
// Module Name: cricket
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


module cricket(
    input clk_fpga,     // 100MHz Basys3 master clock
    input reset,        // Center push button used as reset
    input start,         // Up push button
    input teamSwitch,
    output dp,           // Switch between Team 1 and Team 2
    output [6:0] ca,   // Segment cathodes (seven-segment display)
    output [3:0] an,    // Segment anodes
    output [15:0] leds   // LED outputs
);

    // Internal wires
    wire play;                   // Debounced button press
    wire [7:0] binaryruns;           // Runs from the game logic
    wire [3:0] binarywickets;        // Wickets from the game logic
    wire inningOver;                // Signal: inning complete
    wire gameOver;                  // Signal: game complete
    wire winner; // Signal: winner chosen
    // Debounce push button
    debounce d0(clk_fpga, start,play);
    // Instantiate main game logic
    cricketGame g0(
        .clk_fpga(clk_fpga),
        .reset(reset),
        .play(play),
        .teamSwitch(teamSwitch),
        .binaryruns(binaryruns),
        .binarywickets(binarywickets),
        .leds(leds),
        .inningOver(inningOver),
        .gameOver(gameOver),
        .winner(winner)
    );


    // Display logic to show score/winner on seven-segment
    bcdDisplay b0(
        .clk_fpga(clk_fpga),
        .binaryruns(binaryruns),
        .binarywickets(binarywickets),
        .inningOver(inningOver),
        .gameOver(gameOver),
        .winner(winner),
        .an(an),
        .dp(dp),
        .ca(ca)
    );

endmodule



