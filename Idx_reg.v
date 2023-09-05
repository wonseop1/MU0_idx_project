`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/24 19:40:28
// Design Name: 
// Module Name: Idx_reg
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


module Idx_reg(clk, idxce, alu12, idx12);
    input clk, idxce;
    input [11:0] alu12;
    output [11:0] idx12;
    reg [11:0] idx12;
    always @(negedge clk) 
        if (idxce) idx12 <= alu12[11:0];
endmodule
