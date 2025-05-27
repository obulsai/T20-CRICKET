`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:41:40 AM
// Design Name: 
// Module Name: D_FF
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





module D_FF(
    input clk,     // Clock signal
    input D,       // Data input
    output reg Q   // Output (register)
);

    always @ (posedge clk) begin
        Q <= D;     // On rising edge, capture D into Q
    end

endmodule


