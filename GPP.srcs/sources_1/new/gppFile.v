`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 06:27:25 PM
// Design Name: 
// Module Name: gppFile
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


module gppFile(
input clk,
input [7:0] A,
input [7:0] B,
input resetA,
input resetB,
input fsmDataIn,
input fsmReset,
input decodeEn,
output [6:0] rFirstFour,
output [6:0] rLastFour,
output [6:0] sign,
output [6:0] fsmStudentID
    );
    
    //Multiplexing output at frequency invisible to human eyes

    
    
    
    wire [7:0] w1, w2; //FF wires
    wire [3:0] w3, w4; //FSM wires
    wire [15:0] w5; //Decoder wires
    wire w6; //Alu wires
    wire [3:0] w7, w8;
    
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
    alu gppAlu( .clk(clk), .A(w1), .B(w2), .student_id(), .OP(w5), .Neg(w6), .R1(w7), .R2(w8));
    ssegLab3 aluFirstFour(.bcd(w7), .neg(1'b0), .leds2(), .leds(rFirstFour));
    ssegLab3 aluLastFour(.bcd(w8), .neg(w6), .leds2(sign), .leds(rLastFour));
    
 
    
endmodule
