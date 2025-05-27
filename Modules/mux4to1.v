`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 09:58:45 AM
// Design Name: 
// Module Name: mux4to1
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



module mux4to1(
    input [1:0] sel,
    input [3:0] A, B, C, D,
    output [3:0] q
);

// Selector switches decide what data at the input data lines go through to the output (Y)
assign q = (sel == 2'b00) ? A :
           (sel == 2'b01) ? B :
           (sel == 2'b10) ? C :
           D;

endmodule

