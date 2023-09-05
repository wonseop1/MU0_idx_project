`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 16:15:45
// Design Name: 
// Module Name: sync_rst
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


module sync_rst(reset, clk, sreset);
    input reset, clk;
    output sreset;
    reg sreset, sreset1;
    always @(negedge clk)
        {sreset, sreset1} <= {sreset1, reset};
endmodule
