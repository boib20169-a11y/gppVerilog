`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2026 04:37:43 PM
// Design Name: 
// Module Name: threeby8decoder
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

module fourby16decode(
    input [3:0] w,
    input En,
    output [15:0] Y
    );
    wire w1, w2;
    
    assign w1 =  ~w[3] & En;
    assign w2 = w[3] & En;
    threeby8decoder inst1( .w(w[2:0]), .En(w1), .Y(Y[7:0]));
    threeby8decoder inst2( .w(w[2:0]), .En(w2), .Y(Y[15:8]));
    
    endmodule


module threeby8decoder(
    input [2:0] w,
    input En,
    output reg [7:0] Y
    );
    
    always @(w, En)
        case({En, w})
            {1'b1, 3'd0} : Y = 8'b00000001;
            {1'b1, 3'd1} : Y = 8'b00000010;
            {1'b1, 3'd2} : Y = 8'b00000100;
            {1'b1, 3'd3} : Y = 8'b00001000;
            {1'b1, 3'd4} : Y = 8'b00010000;
            {1'b1, 3'd5} : Y = 8'b00100000;
            {1'b1, 3'd6} : Y = 8'b01000000;
            {1'b1, 3'd7} : Y = 8'b10000000;
            
            default : Y = 'b0;    
        endcase
    
    
endmodule
