`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:49:32 AM
// Design Name: 
// Module Name: lfsr1
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



module lfsr1(
    input clk_fpga,
    input reset,
    output [3:0]lfsr_out
    // For a more detailed simulation uncomment the following:
    // input delivery,
    // output dotball, single, double, triple, fours, sixes, wideball, noball, wicket
);

    reg [5:0] shift;
    wire xor_sum;

    assign xor_sum = shift[1] ^ shift[4]; // Feedback taps

    always @ (posedge clk_fpga) begin
        if (reset)
            shift <= 6'b111111;           // Initialize shift register
        else
            shift <= {xor_sum, shift[5:1]}; // Shift right with feedback
    end

    assign lfsr_out = shift[3:0]; // Output 4-bit LFSR value

    /*
    // For a more detailed simulation, uncomment the following:
    assign dotball  = delivery & ((shift[3:0] == 0) | (shift[3:0] == 1) | (shift[3:0] == 2));
    assign single   = delivery & ((shift[3:0] == 3) | (shift[3:0] == 4) | (shift[3:0] == 5) | (shift[3:0] == 6));
    assign double   = delivery & ((shift[3:0] == 7) | (shift[3:0] == 8) | (shift[3:0] == 9));
    assign triple   = delivery & (shift[3:0] == 10);
    assign fours    = delivery & (shift[3:0] == 11);
    assign sixes    = delivery & (shift[3:0] == 12);
    assign wideball = delivery & (shift[3:0] == 13);
    assign noball   = delivery & (shift[3:0] == 14);
    assign wicket   = delivery & (shift[3:0] == 15);
    */

endmodule



