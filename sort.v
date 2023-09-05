`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 21:30:02
// Design Name: 
// Module Name: dwwdw
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

// File: bubblesort.v
// This is the top level design for EE178 Lab #5a.
// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what // the simulator time step should be (1 ps here).
// Declare the module and its ports. This is
// using Verilog-2001 syntax.
module sort (
    input clk,
    input reset,
    input [15:0] in,
    output  [15:0] out
  );
  reg [15:0] dat;
  reg [3:0] out0;
  reg [3:0] out1;
  reg [3:0] out2;
  reg [3:0] out3;
  
   integer i, j;
    reg [3:0] temp;
    reg [3:0] array [0:3];

  always @(negedge clk or posedge reset) begin
    if(reset) begin
        array[0] <= 4'h0;
        array[1] <= 4'h0;
        array[3] <= 4'h0;
        array[3] <= 4'h0;
    end else begin
      dat[3:0] <= in[3:0];
      dat[7:4] <= in[7:4];
      dat[11:8] <= in[11:8];
      dat[15:12] <= in[15:12];
    end
    end
    
    
    always @(*) begin
        array[0] <= dat[3:0];
        array[1] <= dat[7:4];
        array[2] <= dat[11:8];
        array[3] <= dat[15:12];
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0 ; j < 3; j = j + 1) begin
                if (array[j] > array[j + 1]) begin
                    temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                end 
            end
        end 
      out0 <= array[0];
      out1 <= array[1];
      out2 <= array[2];
      out3 <= array[3];
    end
    

    assign out = {out3,out2,out1,out0};
    
  endmodule
