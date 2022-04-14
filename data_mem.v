module data_mem(
    input clk,
    input [7:0] data_in,
    input wr,
    input [7:0] addr,
    output [7:0] data_out
    );
    reg [7:0] mem [0:255];
    reg [7:0] addr_reg;
    integer i;
    initial begin
        for (i=0;i<256;i=i+1)
            mem[i] = 8'h0;
        end
    always @(posedge clk)
        begin
            if (wr)
                mem[addr] <= data_in;
            else
                addr_reg <= addr;
        end
    assign data_out = mem[addr];
endmodule