`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 16:25:48
// Design Name: 
// Module Name: mux
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

module mux12bit (a, b, s, out);
    input s;
    input [11:0] a, b;
    output [11:0] out;
    assign out = s ? a : b;
endmodule

module mux16bit (a, b, s, out);
    input s;
    input [15:0] a, b;
    output [15:0] out;
    assign out = s ? a : b;
endmodule

module tri16bit (in, oe, out);
    input oe;
    input [15:0] in;
    output [15:0] out;
    assign out = oe ? in : 16'hz;
endmodule