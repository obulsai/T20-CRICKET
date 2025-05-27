`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:18:26 AM
// Design Name: 
// Module Name: binary_to_BCD
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



module binary_to_BCD(
    input [7:0] binaryruns,
    input [3:0] binarywickets,
    input inningOver,
    input gameOver,
    input winner,
    output reg [3:0] wickets, ones, tens, hundreds
);

reg [7:0] data; // Temporarily store binaryRuns for calculations

always @(binaryruns, binarywickets, inningOver, gameOver, winner) begin
    if (~gameOver) begin // Still playing
        if (inningOver) begin
            hundreds <= 4'b0000; // 0
            tens     <= 4'b1100; // v (in bcd7seg)
            ones     <= 4'b1110; // e
            wickets  <= 4'b1010; // r
        end else begin
            data     = binaryruns;
            hundreds = data / 100;
            data     = data % 100;
            tens     = data / 10;
            ones     = data % 10;
            wickets  = binarywickets % 10;
        end
    end else begin // Game is over: lock winner on screen
        case (winner)
            0: begin // t010
                hundreds <= 4'b1011; // t
                tens     <= 4'b0000; // 0
                ones     <= 4'b0001; // 1
                wickets  <= 4'b0000; // 0
            end
            1: begin // t020
                hundreds <= 4'b1011; // t
                tens     <= 4'b0000; // 0
                ones     <= 4'b0010; // 2
                wickets  <= 4'b0000; // 0
            end
        endcase
    end
end

endmodule





   




