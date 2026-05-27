`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2026 01:58:26 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input in,
    input areset,
    output reg [3:0] student_id,
    output reg [3:0] state
    );
    
    reg [3:0] next;
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8;
    
    always @ (*)
    begin
    case(state)
    
        s0 : next = in ? s1 : s0;
        s1 : next = in ? s2 : s2;
        s2 : next = in ? s3 : s2;
        s3 : next = in ? s4 : s3;
        s4 : next = in ? s5 : s4;
        s5 : next = in ? s6 : s5;
        s6 : next = in ? s7 : s6;
        s7 : next = in ? s8 : s7;
        s8 : next = in ? s0 : s8;
        
    endcase
    end
    
    always @ (posedge clk, posedge areset) //asynch reset meaning do not care about clk at all
    state <= areset ? 4'd0 : next;
    
    always @ (*)
    begin
        case(state)
        s0 : student_id = 4'd5;
        s1 : student_id = 4'd0;
        s2 : student_id = 4'd1; 
        s3 : student_id = 4'd2;
        s4 : student_id = 4'd9; 
        s5 : student_id = 4'd4; 
        s6 : student_id = 4'd2;
        s7 : student_id = 4'd5;
        s8 : student_id = 4'd1;
        
        
    endcase
    end
    
    
endmodule
