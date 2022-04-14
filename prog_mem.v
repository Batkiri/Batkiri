module prog_mem(addr,cs,instr); 
input [7:0] addr;
input cs;
output[16:0]instr;
reg [16:0]instr;
always@(cs or addr)
begin
if(!cs)
instr = 17'b00000000000000000;
else  
begin
    case (addr)
        8'h00 : instr = 17'b00000000000000000; //random instructions
        8'h01 : instr = 17'b01000000000000100;
        8'h02 : instr = 17'b00100000000001000;
        8'h03 : instr = 17'b00010000000001100;
        8'h04 : instr = 17'b00001000000010000;
        8'h05 : instr = 17'b00000100000010100;
        8'h06 : instr = 17'b00000010000011000; 
        8'h07 : instr = 17'b00000001000011100;
        8'h08 : instr = 17'b00000000100100000;
        8'h09 : instr = 17'b00000000010100100;
        8'h10 : instr = 17'b00000000001101000;
        8'h11 : instr = 17'b01100000000101100;
        8'h12 : instr = 17'b00110000000110000;
        8'h13 : instr = 17'b00011000000110100;
        8'h14 : instr = 17'b00001100000111000;
        8'h15 : instr = 17'b00000110000111100;
        8'h16 : instr = 17'b00000011001000000;
        8'h17 : instr = 17'b00000001101000100;
        8'h18 : instr = 17'b00000000111001100;
        8'h19 : instr = 17'b01110000001010000;
        8'h20 : instr = 17'b00111000001010100;
        8'h21 : instr = 17'b00011100001011000;
    endcase
    end
    end
endmodule