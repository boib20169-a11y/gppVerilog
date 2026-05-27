`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2026 02:28:43 PM
// Design Name: 
// Module Name: aluModified
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


module aluModified(
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
                16'b0000000000000001: Rout = A + 8'd2;
                16'b0000000000000010: Rout = {2'b00, B[7:2]};
                16'b0000000000000100: Rout = {4'b1111, A[7:4]};
                16'b0000000000001000: begin 
                if(A > B)
                Rout = B; //less
                else
                Rout = A;
                end
              
                16'b0000000000010000: Rout = {A[2:0], A[7:2]}; //rotate A to the right by 2 bits
                
                
                16'b0000000000100000: Rout = {B[0], B[1], B[2],
                B[3], B[4], B[5], B[6], B[7]};
                16'b0000000001000000: Rout = A ^ B;
                16'b0000000010000000: Rout = A + B + ~(8'd4) + 8'b1;
                16'b0000000100000000: Rout = {8{1'b1}};
            endcase
            R1 = Rout[3:0];
            R2 = Rout[7:4];
        end
endmodule
