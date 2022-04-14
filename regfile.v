module regfile(input clk,
    input [7:0] data_in,
    input write,
    input [7:0] A_address,
    input [7:0] B_address,
    input [7:0] D_address,
    output [7:0] A_data,
    output [7:0] B_data
    );
    reg [7:0] mem [0:255];
    reg [7:0] addr_reg;
    reg [7:0] addr_reg2;
    integer i;
    initial begin
            
        for (i=0;i<256;i=i+1)
            mem[i] = 8'h0;
        end
    always @(posedge clk)
        begin
            if (write)
                mem[D_address] <= data_in;
          addr_reg[0] = 0;
        end
    assign A_data = mem[A_address];
    assign A_data = mem[B_address];


endmodule