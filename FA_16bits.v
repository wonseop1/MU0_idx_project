`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/21 22:21:28
// Design Name: 
// Module Name: FA_16bits
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


module FA_16bits(reset, a, b, alufs, alu);

input reset;
input [1:0] alufs;
input [15:0] a, b;
output [15:0] alu;
wire [14:0] c;
wire aen, binv, c0;
// alufs[1:0] aen binv c0
// 2'b00 = b = 0 + b + 0
// 2'b01 = b+1 = 0 + b + 1
// 2'b10 = a+b = a + b + 0
// 2'b11 = a-b = a + !b + 1
assign aen = alufs[1];
assign binv = alufs[1:0] == 2'b11;
assign c0 = alufs[0];
FA_1bit b00(.reset(reset), .a(a[0]), .b(b[0]), .aen(aen), .binv(binv), .cin(c0), .cout(c[0]), .sum(alu[0]));
FA_1bit b01(.reset(reset), .a(a[1]), .b(b[1]), .aen(aen), .binv(binv), .cin(c[0]), .cout(c[1]), .sum(alu[1]));
FA_1bit b02(.reset(reset), .a(a[2]), .b(b[2]), .aen(aen), .binv(binv), .cin(c[1]), .cout(c[2]), .sum(alu[2]));
FA_1bit b03(.reset(reset), .a(a[3]), .b(b[3]), .aen(aen), .binv(binv), .cin(c[2]), .cout(c[3]), .sum(alu[3]));
FA_1bit b04(.reset(reset), .a(a[4]), .b(b[4]), .aen(aen), .binv(binv), .cin(c[3]), .cout(c[4]), .sum(alu[4]));
FA_1bit b05(.reset(reset), .a(a[5]), .b(b[5]), .aen(aen), .binv(binv), .cin(c[4]), .cout(c[5]), .sum(alu[5]));
FA_1bit b06(.reset(reset), .a(a[6]), .b(b[6]), .aen(aen), .binv(binv), .cin(c[5]), .cout(c[6]), .sum(alu[6]));
FA_1bit b07(.reset(reset), .a(a[7]), .b(b[7]), .aen(aen), .binv(binv), .cin(c[6]), .cout(c[7]), .sum(alu[7]));
FA_1bit b08(.reset(reset), .a(a[8]), .b(b[8]), .aen(aen), .binv(binv), .cin(c[7]), .cout(c[8]), .sum(alu[8]));
FA_1bit b09(.reset(reset), .a(a[9]), .b(b[9]), .aen(aen), .binv(binv), .cin(c[8]), .cout(c[9]), .sum(alu[9]));
FA_1bit b10(.reset(reset), .a(a[10]), .b(b[10]), .aen(aen), .binv(binv), .cin(c[9]), .cout(c[10]), .sum(alu[10]));
FA_1bit b11(.reset(reset), .a(a[11]), .b(b[11]), .aen(aen), .binv(binv), .cin(c[10]), .cout(c[11]), .sum(alu[11]));
FA_1bit b12(.reset(reset), .a(a[12]), .b(b[12]), .aen(aen), .binv(binv), .cin(c[11]), .cout(c[12]), .sum(alu[12]));
FA_1bit b13(.reset(reset), .a(a[13]), .b(b[13]), .aen(aen), .binv(binv), .cin(c[12]), .cout(c[13]), .sum(alu[13]));
FA_1bit b14(.reset(reset), .a(a[14]), .b(b[14]), .aen(aen), .binv(binv), .cin(c[13]), .cout(c[14]), .sum(alu[14]));
FA_1bit b15(.reset(reset), .a(a[15]), .b(b[15]), .aen(aen), .binv(binv), .cin(c[14]), .cout( ), .sum(alu[15]));

endmodule
