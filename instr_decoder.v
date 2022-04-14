`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:24 03/07/2022 
// Design Name: 
// Module Name:    instr_decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
///////////////////////////////////////////////////////////////////////////////


module ID(
    input [16:0] instruction,
    output  RW,
    output [2:0] DA,//DA_WIREtAA_WIREddress,
    output [1:0] MD ,//muxd_select,
    output [1:0] BS, //branch_select,
    output PS,//zero_toggle,
    output MW,//memory_write,
    output [3:0] FS,//function select
    output MA,//mux a select 
    output MB,// mux  b select 
    output [2:0]AA, //register a address
    output [2:0]BA, // register b address
    output CS, // constant AA_WIRE
    output [2:0] SH, //shift registers
    output output_write_enable
    );
parameter NOP = 5'b00000; // value 0  eg:nop
parameter JPR = 5'b00001; //value 1   eg: jmp r2
parameter JPL = 5'b00010; //value 2   eg: jml r2, r3
parameter MOV = 5'b00011; // value 3  eg: mov r2 r1
parameter JMP = 5'b00100; //value 4   
parameter LSL = 5'b00101; //value 5   eg: lsl r3 , 03H 
parameter LD  = 5'b00110; //value 6   eg: ld r4 [r1]
parameter ADI = 5'b00111; //value 7   
parameter AIU = 5'b01000; //value 8   
parameter SLT = 5'b01001; //value 9   eg: slt r3 r2 r1
parameter OUT = 5'b01010; //value 10   eg:  out r3 [r2] 
parameter BNZ = 5'b01011; // value 11  eg: bnz r2
parameter BIZ = 5'b01100; // value 12  eg: biz r2 20H eg: 
parameter EOR = 5'b01101; // value 13  
parameter OR  = 5'b01110; // value 14  eg: or r3 r2 35H
parameter ANDI= 5'b01111; // value 15   
parameter ADD = 5'b10000; // value 16  eg: add r3 r2 r1
parameter SUB = 5'b10001; // value 17  eg: sub r1,r2,r3
parameter CMP = 5'b10010; // value 18  
parameter STR = 5'b10011; // value 19 
parameter INP = 5'b10100; // value 20  
reg RW_WIRE;
reg [2:0] DA_WIRE;  //DA_WIREtAA_WIREddress,
reg[1:0] MD_WIRE ;//muxd_select,
reg[1:0] BS_WIRE;  //branch_select,
reg  PS_WIRE ; //zero_toggle,
reg  MW_WIRE ; //memory_write,
reg [3:0] FS_WIRE; //function select
reg MA_WIRE ; //mux a select 
reg MB_WIRE ; // mux  b select 
reg [2:0]AA_WIRE ; //register a address
reg [2:0]BA_WIRE ; // register b address
reg CS_WIRE ; // constant AA_WIRE
reg [2:0] SH_WIRE;
reg [4:0] opcode;
reg output_write_enable_wire;

always@(*) begin


opcode = instruction[16:12]; 

case(opcode)
    NOP:begin    //1C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = 3'b000; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0;
    end 
    JPR:begin  //2C NF
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b01;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;SH_WIRE =3'h0;output_write_enable_wire = 1'b0;  
    end 
    JPL:begin //3C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1100; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0; 
    end 
    MOV:begin //4C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0001; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;SH_WIRE = 3'h0; output_write_enable_wire = 1'b0; 
    end
    JMP:begin  //5C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b1;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b1; 
    end 
    LSL:begin  //6C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0110; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE = instruction[2:0];output_write_enable_wire = 1'b0;
    end
    LD:begin  //7C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b01;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE = 3'h0; output_write_enable_wire = 1'b0;  
    end 
    ADI:begin  //8C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0100; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0;  
    end 
    AIU :begin //9C
	 RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b10;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0;
    end
    SLT:begin //10C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1010; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;SH_WIRE = 3'h0;  output_write_enable_wire = 1'b0;
    end
    OUT:begin //11C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b11;PS_WIRE = 1'b1;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;SH_WIRE= 3'h0; output_write_enable_wire = 1'b0; 
    end 
    BNZ:begin //12C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b11;PS_WIRE = 1'b1;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;SH_WIRE= 3'h0; output_write_enable_wire = 1'b0;  
    end 
    BIZ:begin //13C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b01;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b1000; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b1;SH_WIRE =3'h0;output_write_enable_wire = 1'b0; 
    end 
    EOR:begin//14C
    FS_WIRE = 4'b0110; 
    MD_WIRE = 2'b00; 
    BS_WIRE = 2'b00; 
    RW_WIRE = 1'b1;
    PS_WIRE = 1'b0; 
    MW_WIRE = 1'b0;
    MA_WIRE = 1'b0; 
    MB_WIRE = 1'b0; 
    CS_WIRE = 1'b0; 
    AA_WIRE = instruction[8:6];
    BA_WIRE = instruction[5:3];
    end
    OR:begin //15C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0100; MA_WIRE = 1'b0; MB_WIRE = 1'b1; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0;
    end 
    ANDI:begin //16C
    FS_WIRE = 4'b0001; 
    MD_WIRE = 2'b00 ; 
    BS_WIRE = 2'b00;
    RW_WIRE = 1'b1;
    PS_WIRE = 1'b0; 
    MW_WIRE = 1'b0;
    MA_WIRE = 1'b0; 
    MB_WIRE = 1'b1; 
    CS_WIRE = 1'b0;
    BA_WIRE = 3'b000; 
    AA_WIRE = instruction[8:6];
    DA_WIRE = instruction[11:9];
    end 
    ADD:begin  //17C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0001; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;SH_WIRE = 3'h0; output_write_enable_wire = 1'b0; 
    end 
    SUB:begin //18C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0010; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0;SH_WIRE = 3'h0; output_write_enable_wire = 1'b0; 
    end 
    CMP:begin  //19C
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b10;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0; SH_WIRE = 3'h0;output_write_enable_wire = 1'b0; 
    end 
    STR:begin //20C
    RW_WIRE = 1'b0; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b1;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = instruction[5:3]; CS_WIRE = 1'b0; SH_WIRE = 3'h0;output_write_enable_wire = 1'b0;
    end
    INP:begin //21C
    RW_WIRE = 1'b1; DA_WIRE = instruction[11:9]; MD_WIRE = 2'b10;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = instruction[8:6]; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0; output_write_enable_wire = 1'b0;  
    end    
    default: begin
    RW_WIRE = 1'b0; DA_WIRE = 3'b000; MD_WIRE = 2'b00;BS_WIRE = 2'b00;PS_WIRE = 1'b0;MW_WIRE = 1'b0;FS_WIRE = 4'b0000; MA_WIRE = 1'b0; MB_WIRE = 1'b0; AA_WIRE = 3'b000; BA_WIRE = 3'b000; CS_WIRE = 1'b0;SH_WIRE=3'h0;output_write_enable_wire = 1'b0;
    end 
    endcase
end
assign RW = RW_WIRE;
assign DA = DA_WIRE;
assign MD = MD_WIRE;
assign BS = BS_WIRE;
assign PS = PS_WIRE;
assign MW = MW_WIRE;
assign FS = FS_WIRE;
assign MA = MA_WIRE;
assign MB = MB_WIRE;
assign AA = AA_WIRE;
assign BA = BA_WIRE;
assign CS = CS_WIRE;
assign SH = SH_WIRE;
assign output_write_enable = output_write_enable_wire;
endmodule
