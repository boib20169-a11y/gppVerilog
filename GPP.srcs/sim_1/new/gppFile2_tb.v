`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2026 03:13:14 PM
// Design Name: 
// Module Name: gppFile2_tb
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


module gppFile2_tb;
reg clk;
reg [7:0] A, B;
reg resetA, resetB;
reg fsmDataIn, fsmReset;
reg decodeEn;
wire [6:0] rFirstFour, rLastFour;
wire [6:0] sign;
wire [6:0] fsmStudentID;

gppFile2 u0(.clk(clk), .A(A), .B(B), .resetA(resetA), .resetB(resetB), .fsmDataIn(fsmDataIn), .fsmReset(fsmReset),
.decodeEn(decodeEn), .rFirstFour(rFirstFour), .rLastFour(rLastFour), .sign(sign), .fsmStudentID(fsmStudentID));

always
#10 clk = ~clk;

initial begin
clk = 1'b0;
A = 8'h42;
B = 8'h51;
resetA = 1'b0;
resetB = 1'b0;
fsmDataIn = 1'b1; 
fsmReset = 1'b1;
decodeEn = 1'b1;

#15 fsmReset =1'b0;
end
endmodule
