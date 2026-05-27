`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2026 12:41:07 PM
// Design Name: 
// Module Name: register
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


module dlatch(
input [7:0] D,
input reset,
input clk,
output reg [7:0] Q
    );
    
    always @(clk, reset, D)
    begin
    if(reset)
    Q <= 8'b00000000;
    else
    if(clk)
    Q <= D; //infered latch because there is no else statement
    end
    
endmodule
