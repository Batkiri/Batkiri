module prog_mem_tb;
reg [7:0] addr;
reg cs;
wire [16:0] instr;

prog_mem uut(
    .addr(addr),
    .cs(cs),
    .instr(instr));
    
initial 
begin
addr = 8'h00;
cs =0;
#20;
cs =1;
addr = 8'h01;
#10;
addr = 8'h02;
#10;
addr = 8'h03;
#10;
addr = 8'h04;
#10;
addr = 8'h05;
#10;
addr = 8'h06;
#10;
addr = 8'h07;
#10;
addr = 8'h08;
#10;
addr = 8'h09;
#10;
addr = 8'h10;
#10;
addr = 8'h11;
#10;
addr = 8'h12;
#10;
addr = 8'h13;
#10;
addr = 8'h14;
#10;
addr = 8'h15;
#10;
addr = 8'h16;
#10;
addr = 8'h17;
#10;
addr = 8'h18;
#10;
addr = 8'h19;
#10;
addr = 8'h20;
#10;
addr = 8'h21;
end
endmodule