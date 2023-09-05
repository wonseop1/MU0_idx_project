`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 17:22:46
// Design Name: 
// Module Name: tb_MU0
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


module tb_MU0();
    reg reset, clk;
    wire [11:0] addr;
    wire [15:0] data;
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        reset = 1;
        #35
        reset = 0;
    end
    
    mu0 MU0(.reset(reset), .clk(clk), .addr1(addr), .data(data), .memrq(memrq), .rnw(rnw));
    mem_model mem_model(.clk(clk), .addr(addr), .data(data), .memrq(memrq), .rnw(rnw));
endmodule
