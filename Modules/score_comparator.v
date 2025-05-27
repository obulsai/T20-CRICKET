`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:56:47 AM
// Design Name: 
// Module Name: score_comparator
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

module score_comparator(
    input clk_fpga,
    input reset,
    input [11:0] team1Data,    // [11:4] = runs, [3:0] = wickets
    input [11:0] team2Data,    // same format
    input [6:0] team1Balls,
    input [6:0] team2Balls,
    input [3:0] binarywickets,
    input [15:0] balls,
    output reg inningOver,
    output reg gameOver,
    output reg winner
);

// Inning over: 10 wickets or 120 balls
always @(posedge clk_fpga) begin
    inningOver <= ((binarywickets >= 10) || (balls >= 120));
end

// Game over: both teams have completed innings
always @(posedge clk_fpga or posedge reset) begin
    if (reset)
        gameOver <= 0;
    else if (((team1Data[3:0] >= 10) || (team1Balls >= 120)) &&
             ((team2Data[3:0] >= 10) || (team2Balls >= 120)))
        gameOver <= 1;
        else
        gameOver <= gameOver;
end

// Winner locked at end of game
always @(posedge gameOver) begin
    if (team1Data[11:4] > team2Data[11:4])
        winner <= 0; // team 1 wins
    else
        winner <= 1; // team 2 wins
end

endmodule
