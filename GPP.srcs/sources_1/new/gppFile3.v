`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 12:59:04 PM
// Design Name: 
// Module Name: gppFile3
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


module gppFile3(
input clk,
input [7:0] A,
input [7:0] B,
input resetA,
input resetB,
input fsmDataIn,
input fsmReset,
input decodeEn,
output [6:0] Result,
output [6:0] fsmStudentID
    );
    
            wire [7:0] w1, w2; //FF wires
    wire [3:0] w3, w4; //FSM wires
    wire [15:0] w5; //Decoder wires
    wire w6; //Alu wires
    wire [3:0] w7;
    
    //delay fix 
    reg [3:0] w3_delayed;
    
    always @(posedge clk or posedge fsmReset) begin
    if (fsmReset) begin
        w3_delayed <= 4'd5; // Force it to start at 5 during reset so it doesn't display 0
    end else begin
        w3_delayed <= w3;   // Delay the FSM digit by exactly 1 clock cycle
    end
    end
    
        //Latches
    dlatch latchA( .D(A), .reset(resetA), .clk(clk), .Q(w1));  
    dlatch latchB( .D(B), .reset(resetB), .clk(clk), .Q(w2));
    
    //Control unit
    fsm gppFsm( .clk(clk), .in(fsmDataIn), .areset(fsmReset), .student_id(w3), .state(w4));
    ssegLab3 fsm(.bcd(w3_delayed), .neg(1'b0), .leds2(), .leds(fsmStudentID)); //1'b0 neg for nothing
    
    //Decoder
    fourby16decode gppDecode( .w(w4), .En(decodeEn), .Y(w5));
    
    //ALU - studentID output not used
    aluModified2 gppAlu( .clk(clk), .A(w1), .B(w2), .student_id(w3), .Result(w7));
    ssegLab6 aluYesOrNo(.bcd(w7), .leds(Result));


endmodule
