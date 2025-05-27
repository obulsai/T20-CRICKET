`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:32:26 AM
// Design Name: 
// Module Name: debounce
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



module debounce(
    input clk_fpga,         // Debounce clock (e.g., 10Hz = 100ms cycle)
    input button,           // Noisy input button
    output play // Clean output
);

    wire Q1, Q2, Q2_bar;

    // Two-stage flip-flop debouncing
    D_FF d1(clk_fpga, button, Q1);   // First D Flip-Flop
    D_FF d2(clk_fpga, Q1, Q2);       // Second D Flip-Flop

    assign Q2_bar = ~Q2;
    assign play = Q1 & Q2_bar;

endmodule



