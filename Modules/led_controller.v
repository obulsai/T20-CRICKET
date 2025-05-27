`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:58:27 AM
// Design Name: 
// Module Name: led_controller
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




module led_controller(
    input clk_fpga,
    input reset,
    input teamSwitch,
    input play,
    input [3:0] lfsr_out,
    input inningOver,
    input gameOver,
    output reg [15:0] leds,
    output reg [6:0] team1Balls,
    output reg [6:0] team2Balls
);

wire [15:0] scroll; // send values for scrolling LEDs from scrollLEDs module when the game is over

// Count up the balls and update the LEDs
always @(posedge clk_fpga or posedge reset) begin
    if (reset) begin
        leds <= 0;
        team1Balls <= 0;
        team2Balls <= 0;
    end else if (gameOver) begin
        leds <= scroll; // use scrolling LEDs from scrollLEDs module when the game is over
    end else if (play) begin
        if ((teamSwitch == 0) && (inningOver == 0)) begin // increment balls only if team's inning is not over
            case (lfsr_out) // pseudo-random number from LFSR
                13, 14: team1Balls <= team1Balls; // Wide ball and No ball
                default: team1Balls <= team1Balls + 1; // valid delivery: 1s, 2s, 3s, 4s, 6s, dot balls
            endcase
            leds <= team1Balls;
        end else if ((teamSwitch) && (inningOver == 0)) begin // for team 2
            case (lfsr_out)
                13, 14: team2Balls <= team2Balls; // Wide ball and No ball
                default: team2Balls <= team2Balls + 1;
            endcase
            leds <= team2Balls;
        end
       end
     else if(~teamSwitch)
     leds<=team1Balls;
     else
     leds<=team2Balls;
   end
  
  scroll_Leds g5(clk_fpga,scroll);
  
  endmodule






