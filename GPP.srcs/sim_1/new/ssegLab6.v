`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2026 12:43:02 PM
// Design Name: 
// Module Name: ssegLab6
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


module ssegLab6(
    input [3:0] bcd,
    output reg [1:7] leds
    );
    
    always @(*) begin
    case(bcd)
    
    4'd0: leds = 7'b1101010; //no
    4'd1: leds = 7'b1000100; //yes
                  
    
    default: leds = 7'b0000000;
    endcase
    end
endmodule
