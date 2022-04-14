

module MCU_TB();
reg clk;
reg reset;

MCU UUT(.clk(clk),.reset(reset));
initial begin
clk =0;
reset = 0;
#5;
reset = 1;
#10;
reset = 0;

#150;

#200;
end
always begin
clk = 0;
forever #5 clk = ~clk;
end  
endmodule
