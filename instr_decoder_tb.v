`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:31:38 03/21/2022
// Design Name:   ID
// Module Name:   /home/eng/m/mks200001/MicroLab/instruction_decoder/instr_decoder_tb.v
// Project Name:  instruction_decoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instr_decoder_tb;

	// Inputs
	reg [16:0] instruction;

	// Outputs
	wire RW;
	wire [2:0] DA;
	wire [1:0] MD;
	wire [1:0] BS;
	wire PS;
	wire MW;
	wire [3:0] FS;
	wire MA;
	wire MB;
	wire [2:0] AA;
	wire [2:0] BA;
	wire CS;
	wire [2:0] SH;
	wire output_write_enable;

	// Instantiate the Unit Under Test (UUT)
	ID uut (
		.instruction(instruction), 
		.RW(RW), 
		.DA(DA), 
		.MD(MD), 
		.BS(BS), 
		.PS(PS), 
		.MW(MW), 
		.FS(FS), 
		.MA(MA), 
		.MB(MB), 
		.AA(AA), 
		.BA(BA), 
		.CS(CS), 
		.SH(SH), 
		.output_write_enable(output_write_enable)
	);

	initial begin
		instruction=17'b00000000000000000;
#100;
instruction=17'b01111_010_110_001_000;
#100;
instruction=17'b10100_100_010_010000;
#100;
instruction=17'b10000010010010000;
#100;
$finish;
end
endmodule