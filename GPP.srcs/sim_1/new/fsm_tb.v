`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 09:37:58 AM
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb;
reg clk;
reg in;
reg areset;
wire [3:0] student_id;
wire [3:0] state;

fsm u0( .clk(clk), .in(in), .areset(areset), .student_id(student_id), .state(state));

    always
    #10 clk = ~clk;
    
    initial
        begin
            {clk, in, areset} = {1'b0, 1'b1, 1'b1};
            
            #15 areset = 'b0;
            
        end
            
    

    
    
endmodule
