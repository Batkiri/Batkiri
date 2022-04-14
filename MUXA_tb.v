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


module MUXA_tb;
    reg [2 :0] registerA;
    reg [7:0] pc_1;
    reg MA;
    wire bus_A;
    MUX_A UUT1 (.registerA(registerA), .pc_1(pc_1),.MA(MA), .bus_A(bus_A));
    initial begin
	 pc_1=0;
	 registerA=1;

    MA = 1;
    #20;
    MA = 0;
    end
endmodule
