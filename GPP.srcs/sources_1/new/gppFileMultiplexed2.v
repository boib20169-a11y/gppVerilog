`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2026 03:07:38 PM
// Design Name: 
// Module Name: gppFileMultiplexed2
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


module gppFileMultiplexed2(
input clk,
input clk2,
input [7:0] A,
input [7:0] B,
input resetA,
input resetB,
input fsmReset,
output reg [6:0] seg,
output reg [3:0] an
    );
    
         //Multiplexing output at frequency invisible to human eyes
    wire [6:0] rFirstFour;
    wire [6:0] rLastFour;
    wire [6:0] sign;
    wire [6:0] fsmStudentID;
    
    
    
    wire [7:0] w1, w2; //FF wires
    wire [3:0] w3, w4; //FSM wires
    wire [15:0] w5; //Decoder wires
    wire w6; //Alu wires
    wire [3:0] w7, w8;
    
    reg [16:0] clk_div = 0;
    reg [1:0] digit_select = 0;
    
        //delay fix 
    reg [3:0] w3_delayed;
    
    always @(posedge clk2 or posedge fsmReset) begin
    if (fsmReset) begin
        w3_delayed <= 4'd5; // Force it to start at 5 during reset so it doesn't display 0
    end else begin
        w3_delayed <= w3;   // Delay the FSM digit by exactly 1 clock cycle
    end
    end
     //Latches
    dlatch latchA( .D(A), .reset(resetA), .clk(clk2), .Q(w1));  
    dlatch latchB( .D(B), .reset(resetB), .clk(clk2), .Q(w2));
    
    //Control unit
    fsm gppFsm( .clk(clk2), .in(1'b1), .areset(fsmReset), .student_id(w3), .state(w4));
    ssegLab3 fsm(.bcd(w3_delayed), .neg(1'b0), .leds2(), .leds(fsmStudentID)); //1'b0 neg for nothing
    
    //Decoder
    fourby16decode gppDecode( .w(w4), .En(1'b1), .Y(w5));
    
    //ALU - studentID output not used
    aluModified gppAlu( .clk(clk2), .A(w1), .B(w2), .student_id(), .OP(w5), .Neg(w6), .R1(w7), .R2(w8));
    ssegLab3 aluFirstFour(.bcd(w7), .neg(1'b0), .leds2(), .leds(rFirstFour));
    ssegLab3 aluLastFour(.bcd(w8), .neg(w6), .leds2(sign), .leds(rLastFour));
    
    //The multeplexed counter
    always @(posedge clk) begin
        if (clk_div == 99999) begin
            clk_div <= 0;
            digit_select <= digit_select + 1; // Increments every 1ms (1kHz)
        end else begin
            clk_div <= clk_div + 1;
        end
    end
    
    always @(*) begin
        case(digit_select)
            2'b00: begin
                seg = rFirstFour;
                an  = 4'b1110; // Active-low: turns on rightmost digit
            end
            2'b01: begin
                seg = rLastFour;
                an  = 4'b1101; 
            end
            2'b10: begin
                seg = sign;
                an  = 4'b1011; 
            end
            2'b11: begin
                seg = fsmStudentID;
                an  = 4'b0111; // Active-low: turns on leftmost digit
            end

            endcase
            end
endmodule
