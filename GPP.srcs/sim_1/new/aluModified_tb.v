`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2026 02:43:02 PM
// Design Name: 
// Module Name: aluModified_tb
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


module aluModified_tb;
reg clk;
reg [7:0] A;
reg [7:0] B;
reg [3:0] student_id;
reg [15:0] OP;
wire Neg;
wire [3:0] R1;
wire [3:0] R2;

aluModified u0 ( .clk(clk), .A(A), .B(B), .student_id(student_id), .OP(OP), .Neg(Neg), .R1(R1), .R2(R2));
always 
begin
#10 clk = ~clk;
end

initial 
    begin
        clk = 'b0;
        A = 8'h42;
        B = 8'h51;
        student_id = 4'd1;
        OP = 16'b0000000000000001;
        
        #15 
            repeat(8) begin
                #20 OP = {OP[14:0], OP[15]}; //shift register 
                end
        //#20 OP = 16'b0000000000000100;
//        #20 OP = 16'b0000000000001000;
//        #20 OP = 16'b0000000000010000;
//        #20 OP = 16'b0000000000100000;
//        #20 OP = 16'b0000000001000000;
//        #20 OP = 16'b0000000010000000;
//        #20 OP = 16'b0000000100000000;
        
    end
endmodule
