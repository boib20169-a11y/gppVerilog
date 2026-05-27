`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2026 07:50:06 AM
// Design Name: 
// Module Name: 4decode_tb
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


module fourdecode_tb;
    reg [3:0] w;
    reg En;
    wire [15:0] Y;
    
    
    fourby16decode u0( .w(w), .En(En), .Y(Y));
    initial begin
    {En, w} = {1'b1, 4'd0};
    #50 {En, w} = {1'b1, 4'd1};
    #50 {En, w} = {1'b1, 4'd2};
    #50 {En, w} = {1'b1, 4'd3};
    #50 {En, w} = {1'b1, 4'd7};
    #50 {En, w} = {1'b1, 4'd14};
    #50 {En, w} = {1'b1, 4'd15};
    end
endmodule
