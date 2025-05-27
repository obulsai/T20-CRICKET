`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:09:56 AM
// Design Name: 
// Module Name: two_bit_counter
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



module two_bit_counter(
    input clk,            // Input clock
    output reg [1:0] y    // 2-bit counter output
);

    // Increment on each rising edge of the clock
    always @(posedge clk) begin
        y <= y + 1'b1;
    end

endmodule


