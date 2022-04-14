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


module MUXB_tb;
    reg [2:0] registerB;
    reg [7:0] CS;
    reg MB;
    wire bus_B;
    MUX_B UUT1 (.registerB(registerB), .CS(CS),.MB(MB), .bus_B(bus_B));
    initial begin
	 CS=0;
	 registerB=1;
    MB = 1;
    #20;
    MB = 0;
    end
endmodule
