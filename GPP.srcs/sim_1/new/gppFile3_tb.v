`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 01:06:24 PM
// Design Name: 
// Module Name: gppFile3_tb
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


module gppFile3_tb;
reg clk;
reg [7:0] A, B;
reg resetA, resetB;
reg fsmDataIn, fsmReset;
reg decodeEn;
wire [6:0] Result;
wire [6:0] fsmStudentID;

gppFile3 u0(.clk(clk), .A(A), .B(B), .resetA(resetA), .resetB(resetB), .fsmDataIn(fsmDataIn), .fsmReset(fsmReset),
.decodeEn(decodeEn), .Result(Result), .fsmStudentID(fsmStudentID));
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
