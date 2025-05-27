`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2025 09:56:19 AM
// Design Name: 
// Module Name: display
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


module display(
    input [3:0] q,
    output reg [7:0] ca
);

// Display 7-segment equivalent of 4-bit digit y
always @(q) begin
    case (q)
0:ca=8'b1100_0000;
1:ca=8'b1111_1001;
2:ca=8'b1010_0100;
3:ca=8'b1011_0000;
4:ca=8'b1001_1001;
5:ca=8'b1001_0010;
6:ca=8'b1000_0010;
7:ca=8'b1111_1000;
8:ca=8'b1000_0000;
9:ca=8'b1001_0000;
10:ca=8'b1000_1000;//A
11:ca=8'b1000_0111;//T
12:ca=8'b1100_0001;//U
14:ca=8'b1000_0110;//E
    endcase
end

endmodule
