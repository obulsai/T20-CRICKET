`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 10:53:34 AM
// Design Name: 
// Module Name: score_and_wickets
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






module score_and_wickets(
    input clk_fpga,
    input reset,
    input play,
    input teamSwitch,
    input [3:0] lfsr_out,
    input gameOver,
    output reg [7:0] binaryruns,
    output reg [3:0] binarywickets,
    output reg [11:0] team1Data, // stores and updates team1's scores and runs when switch is 0
    output reg [11:0] team2Data  // stores and updates team2's scores and runs when switch is 1
);

    localparam single = 16;
    localparam double = 32;
    localparam triple = 48;
    localparam four   = 64;
    localparam six    = 96;

    // Update scores after each delivery (bowl) based on cricket rules
    always @ (posedge clk_fpga or posedge reset) begin
        if (reset) begin
            binaryruns <= 0;
            binarywickets <= 0;
            team1Data <= 0;
            team2Data <= 0;
        end
        else if (gameOver) begin
            binaryruns <= binaryruns;
            binarywickets <= binarywickets;
            team1Data <= team1Data;
            team2Data <= team2Data;
        end
         else if (play) begin
            if ((~teamSwitch) && (binarywickets < 10)) begin // increment score of team 1
                case (lfsr_out) // pseudorandom number from linear feedback shift register
                    0, 1, 2: team1Data <= team1Data;             // dot balls
                    3, 4, 5, 6: team1Data <= team1Data + single;
                    7, 8, 9: team1Data <= team1Data + double;
                    10: team1Data <= team1Data + triple;
                    11: team1Data <= team1Data + four;
                    12: team1Data <= team1Data + six;
                    13, 14: team1Data <= team1Data;              // wide ball and no balls
                    15: team1Data <= team1Data + 1;              // wicket
                endcase
                binaryruns <= team1Data[11:4];
                binarywickets <= team1Data[3:0];
            end
            else if ((teamSwitch) && (binarywickets < 10)) begin // increment score of team 2
                case (lfsr_out) // pseudorandom number from linear feedback shift register
                    0, 1, 2: team2Data <= team2Data;             // dot balls
                    3, 4, 5, 6: team2Data <= team2Data + single;
                    7, 8, 9: team2Data <= team2Data + double;
                    10: team2Data <= team2Data + triple;
                    11: team2Data <= team2Data + four;
                    12: team2Data <= team2Data + six;
                    13, 14: team2Data <= team2Data;              // wide ball and no balls
                    15: team2Data <= team2Data + 1;              // wicket
                endcase
                binaryruns <= team2Data[11:4];
                binarywickets <= team2Data[3:0];
            end
            end
            else 
case (teamSwitch) 
0: begin 
binaryruns <= team1Data [11:4]; 
binarywickets <= team1Data [3:0]; 
end 
1: begin 
binaryruns <= team2Data [11:4]; 
binarywickets <=team2Data [3:0]; 
end 
endcase 
end 
endmodule




