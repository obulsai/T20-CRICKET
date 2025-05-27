`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:00:55 AM
// Design Name: 
// Module Name: decoder2to4
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



module decoder2to4(
    input [1:0] y,
    output reg dp,
    output reg [3:0] an
);
// Cycle through the four anodes using en (output of 2-bit counter)
always @(y) begin
    case (y)
        0: begin
            an = 4'b0001;
            dp = 1'b1;
        end
        1: begin
            an = 4'b0010;
            dp = 1'b0; // Turn on the active low decimal point after anode AN1
        end
        2: begin
            an = 4'b0100;
            dp = 1'b1;
        end
        3: begin
            an = 4'b1000;
            dp = 1'b1;
        end
    endcase
end

endmodule






