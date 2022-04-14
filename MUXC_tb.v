`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:26:44 AM
// Design Name: 
// Module Name: MUXA_tb
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


module MUXC_tb;
    reg [2 :0] registerC;
    reg [7:0] pc_1;
    reg MC;
    wire bus_C;
    MUX_C UUT1 (.registerC(registerC), .pc_1(pc_1),.MC(MC), .bus_C(bus_C));
    initial begin
    MC = 1;
    #20;
    MC = 0;
    end
endmodule
