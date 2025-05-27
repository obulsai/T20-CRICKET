`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:31:19 AM
// Design Name: 
// Module Name: scroll_Leds
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



module scroll_Leds(
    input clk_fpga,
    output reg [15:0]led
);

wire clk_10Hz; // 10Hz signal from slow clock

// Shift an LED every rising edge of the 10Hz clock
always @(posedge clk_10Hz) begin
    if (led == 16'hffff)
        led <= 16'hfffe; // reset to initial pattern
    else
        led <= {led[14:0], 1'b1}; // shift rightmost unlit LED left
end

// Instantiate a module that generates a slower 10Hz clock
slowClock_10Hz c0(clk_fpga, clk_10Hz);

endmodule







