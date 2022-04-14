HLS Vivado
1. Go to File > New Project and add the main CPP file and the C++ testbench file.
2. In the board components menu, choose the Zybo development board.
3. Enter the inputs into the testbench.
4. Run a C simulation to test the code's functioning. In the C- simulation window, you can see the GCD's accurate output.
5.  RUN C Synthesis
6. RUN Verilog and VHDL co-simulation For both RTL languages, the simulation was successful.
7. RUN RTL export
8. Then we launch Vivado Ide.
Vivado IDE
1. Create a new RTL project and then pick the Zybo development board in-board component from the drop-down menu.
2. Next, we use IP integrator's generate block design to create IP.
3. The zynq processor is included to the design.
4. We add the Vivado HLS exported IP to the IP inventory.
5. We add the GCD IP and AXI DMA to the design window.
6. The scatter engine in the AXI DMA must be disabled, and high-speed slave must be enabled in the Zynq processor.
7. We ran block automation/auto-connect and then manually fine-tuned it.
8. Verify the Design
9. Select the default option when creating the HDL Wrapper for the Design.
10. Finally, we do synthesis and implementation.
Then we use the produce bitstream option to create the bitstream.
12. Select Include Bitstream from the Export Hardware menu, and leave the rest of the parameters alone.
13. The bitstream is exported.
14. We use the file option to start the SDK.
