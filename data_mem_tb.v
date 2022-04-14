module data_mem_tb;
reg clk;
reg [7:0] data_in;
reg wr;
reg [7:0] addr;
wire [7:0] data_out;

data_mem uut(
    .clk(clk),
    .data_in(data_in),
    .wr(wr),
    .addr(addr),
    .data_out(data_out));
always #5 clk = ~clk;
initial 
begin
clk = 1;
wr = 1;
addr = 8'H00;
data_in = 8'HAA;

#10;
addr = 8'H01;
data_in = 8'HBB;

#10;
addr = 8'H02;
data_in = 8'HCC;

#10;
wr = 0;
addr = 8'H01;

#10;
addr = 8'H00; 

#10;
addr = 8'H02; 

end
endmodule