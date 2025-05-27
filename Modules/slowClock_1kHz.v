`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:15:36 AM
// Design Name: 
// Module Name: slowClock_1kHz
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


module slowClock_1kHz(
    input clk_fpga,       // 100 MHz master clock
    output reg clk_1kHz   // 1 kHz output clock
);

    localparam clkdiv = 50_000 - 1;   // Divide factor for 100MHz to 1kHz
    reg [15:0] period_count = 0;     // Counter to track clock cycles

    // Clock division logic
    always @(posedge clk_fpga) begin
        if (period_count == clkdiv) begin
            period_count <= 0;
            clk_1kHz <= ~clk_1kHz;   // Toggle the output clock
        end else begin
            period_count <= period_count + 1'b1;
            clk_1kHz <= clk_1kHz;    // Maintain current state
        end
    end

endmodule 
