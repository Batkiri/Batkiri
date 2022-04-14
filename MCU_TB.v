`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 10:50:26 AM
// Design Name: 
// Module Name: MCU_TB
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
module TB_ControlUnit();
reg clk,reset;
wire [7:0] PCReg,PCMinusOneReg,PCMinusTwoReg;
wire [16:0] InstructionReg;
wire RWReg,PSReg,MWReg,MAReg,MBReg,CSReg;
wire [1:0] MDReg,BSReg;
wire [2:0] DAReg,AAReg,BAReg;
wire [3:0] FSReg;
wire [2:0] SHReg;
wire [7:0] A_DataReg,B_DataReg;
wire [7:0] BusAReg, BusBReg;
wire [7:0] ALU_FSReg;
wire [7:0] DataMemOutpReg;
   
Control_Unit UUT(.clk(clk),.reset(reset),.PCReg(PCReg),.PCMinusOneReg(PCMinusOneReg),.PCMinusTwoReg(PCMinusTwoReg),.InstructionReg(InstructionReg),.RWReg(RWReg),.PSReg(PSReg),.MWReg(MWReg),.MAReg(MAReg),.MBReg(MBReg),.CSReg(CSReg),.MDReg(MDReg),.BSReg(BSReg),.DAReg(DAReg),.AAReg(AAReg),.BAReg(BAReg),.FSReg(FSReg),.SHReg(SHReg),.A_DataReg(A_DataReg),.B_DataReg(B_DataReg),.BusAReg(BusAReg),.BusBReg(BusBReg),.ALU_FSReg(ALU_FSReg),.DataMemOutpReg(DataMemOutpReg));

initial
        begin
            clk = 0;
        end
    always #7 clk = ~clk;
$finish;
endmodule