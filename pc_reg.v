`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 16:19:09
// Design Name: 
// Module Name: pc_reg
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

module pc_reg (clk, pcce, alu, pc);
    input clk, pcce;
    input [15:0] alu;
    output [15:0] pc;
    reg [15:0] pc;
    always @(negedge clk)
        if (pcce) pc <= alu[15:0];
endmodule

