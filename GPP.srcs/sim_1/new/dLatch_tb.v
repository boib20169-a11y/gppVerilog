`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 10:56:31 AM
// Design Name: 
// Module Name: dLatch_tb
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


module dLatch_tb;
reg [7:0] D; 
reg reset;
reg clk;
wire [7:0] Q;

    dlatch u0( .D(D), .reset(reset), .clk(clk), .Q(Q));
    
    always
    #10 clk = ~clk;
    
        initial begin
        {D[7:0], reset, clk} = {{8{1'b0}}, 1'b1, 1'b0};
        #15 {D[7:0], reset} = {{8{1'b1}}, 1'b0};
        #5 D = 8'b10100110;
        //proves level sensitivity
        #10 D = {8{1'b0}};
        #5 D = {8{1'b1}};
        end
endmodule
