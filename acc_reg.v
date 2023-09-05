`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 16:22:01
// Design Name: 
// Module Name: acc_reg
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

module acc_reg (clk, accce, alu, acc, 
acc15, accz);
    input clk, accce;
    input [15:0] alu;
    output acc15, accz;
    output [15:0] acc;
    reg [15:0] acc;
    assign acc15 = acc[15];
    assign accz = acc == 16'h0;
    always @(negedge clk) 
        if (accce) acc <= alu[15:0];
endmodule
