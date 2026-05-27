`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 02:21:33 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input [3:0] student_id,
    input [15:0] OP,
    output reg Neg,
    output reg [3:0] R1,
    output reg[3:0] R2
    );
    
    reg [7:0] Rout;
    always @ (posedge clk)
        begin
            Neg = 1'b0;
            case(OP)
                16'b0000000000000001: Rout = A + B;
                16'b0000000000000010: begin
                                     Rout = A + ~B + 1'b1;
                                     Neg = Rout[7];
                                     end
                16'b0000000000000100: Rout = ~A;
                16'b0000000000001000: Rout = ~(A & B);
                16'b0000000000010000: Rout = ~(A | B);
                16'b0000000000100000: Rout = A & B;
                16'b0000000001000000: Rout = A ^ B;
                16'b0000000010000000: Rout = A | B;
                16'b0000000100000000: Rout = A ~^ B;
            endcase
            R1 = Rout[3:0];
            R2 = Rout[7:4];
        end
        
    
endmodule




