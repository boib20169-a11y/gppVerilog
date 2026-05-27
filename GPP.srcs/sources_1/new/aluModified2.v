`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 12:49:08 PM
// Design Name: 
// Module Name: aluModified2
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


module aluModified2(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input [3:0] student_id,
    output reg [3:0] Result
    );
    
    always @(posedge clk)
    
    if(A[3:0] < student_id || A[7:4] < student_id)
    Result = 4'd1;
    else
    Result = 4'd0;
    
    
    
    
    
endmodule
