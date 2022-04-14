`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:33:14 03/07/2022
// Design Name:   alu
// Module Name:   H:/MicroLab/alu/alu_tb.v
// Project Name:  alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [3:0] function_select;
	reg [2:0] shift;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [7:0] F;
	wire zero;
	wire neg;
	wire carry;
	wire overflow;
	wire [7:0] X;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.function_select(function_select), 
		.shift(shift), 
		.A(A), 
		.B(B), 
		.F(F), 
		.zero(zero), 
		.neg(neg), 
		.carry(carry), 
		.overflow(overflow), 
		.X(X)
	);

	initial begin
    function_select = 4'b0000; A = 8'b0; B = 8'b0; shift = 2;
    #100;
    function_select = 4'b1000; A = 8'b11100; B = 8'b11101; shift = 2;
    #100;
    function_select = 4'b0001; A = 8'b11100; B = 8'b11101; shift = 2;
    #100;
    function_select = 4'b0011; A = 8'b11100; B = 8'b11101; shift = 2;
    #100;
    function_select = 4'b0010; A = 8'b11100; B = 8'b11101; shift = 2;
    end
	
      
endmodule

