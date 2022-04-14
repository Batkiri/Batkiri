module regfile_tb();
reg clk;
reg [7:0] data_in;
reg write;
reg [7:0] A_address;
reg [7:0] B_address;
reg [7:0] D_address;
wire [7:0] A_out;
wire [7:0] B_out;

regfile uut(
    .clk(clk),
    .data_in(data_in),
    .write(write),
    .A_address(A_address),
    .B_address(B_address),
    .D_address(D_address),
    .A_out(A_out), 
    .B_out(B_out) 
    );
always #5 clk = ~clk;
initial 
begin
clk = 0;
write = 0;
A_address = 8'b0;
B_address = 8'b0;
D_address = 8'b0;
data_in = 8'H0;

#70;
write =1'b1;
data_in = 8'HAA;
D_address = 8'b1;

#20;
data_in = 8'H1;
D_address = 8'b00000010;

#20;
data_in = 8'H2;
D_address = 8'b00000011;

#20;
data_in = 8'H3;
D_address = 8'b00000100;
write = 1'b0;

#20;
A_address = 8'b00000010; 
B_address = 8'b1;
end
endmodule