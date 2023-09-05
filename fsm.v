`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 15:16:11
// Design Name: 
// Module Name: fsm
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
`define LDA     4'b0000
`define STO     4'b0001
`define ADD     4'b0010
`define SUB     4'b0011
`define JMP     4'b0100
`define JGE     4'b0101
`define JNE     4'b0110
`define STP     4'b0111
`define MOVI    4'b1000
`define MOVIDX  4'b1001
`define LDIDX   4'b1010
`define STIDX   4'b1011
`define ADDIDX  4'b1100
`define SUBIDX  4'b1101
`define STOIDX  4'b1110
`define BUBIDX  4'b1111


module fsm (reset, clk, opcode, accz, acc15, asel, bsel, accce, pcce, irce, accoe, alufs, memrq, rnw, idx_en, csel, idxce, idxoe, dsel);
input reset, clk, accz, acc15;
input [3:0] opcode;
output asel, bsel, accce, pcce, irce, accoe, memrq, rnw, idx_en, csel, idxce, idxoe, dsel;
output [1:0] alufs;
reg exft;
reg sort_en;
reg [15:0] outs; // Actually, this is wire
always @(opcode or reset or exft or accz or acc15 or sort_en) begin
if (reset) outs = {1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 2'bxx, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else begin
case (opcode)
`LDA: begin if (!exft) outs = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`STO: begin if (!exft) outs = {1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b1, 2'bxx, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`ADD: begin if (!exft) outs = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 2'b10, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`SUB: begin if (!exft) outs = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 2'b11, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`JMP: outs = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
`JGE: begin if (!acc15) outs = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`JNE: begin if (!accz) outs = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`STP: outs = {1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};

`MOVI: begin if (!exft) outs = {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 1'b0, 1'bx, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`MOVIDX: begin if (!exft) outs = {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 2'b00, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`LDIDX: begin if (!exft) outs = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 2'b00, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`STIDX: begin if (!exft) outs = {1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b1, 2'bxx, 1'b1, 1'b0, 1'b1, 1'b0, 1'bx, 1'b0, 1'b0, 1'b1};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`ADDIDX: begin if (!exft) outs = {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b10, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'bx};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`SUBIDX: begin if (!exft) outs = {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b11, 1'b0, 1'bx, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'bx};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`STOIDX: begin if (!exft) outs = {1'b1, 1'bx, 1'b0, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b1, 1'b0, 1'b1, 1'b0, 1'bx, 1'b0, 1'b1, 1'b0};
else outs = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end
`BUBIDX: /*begin if (!exft) begin 
if (sort_en) outs = {1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx}; 
else outs = {1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b0, 1'bx, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx};
end else outs = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}; end */
begin outs = (sort_en)  ? {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b0, 1'bx, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx} :
              (!exft)    ? {1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'bxx, 1'b0, 1'bx, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'bx} :
                           {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 2'b01, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
                        end
endcase
end /* end of else */
end /* end of always */


assign asel     = outs[15];
assign bsel     = outs[14];
assign accce    = outs[13];
assign pcce     = outs[12];
assign irce     = outs[11];
assign accoe    = outs[10];
assign alufs    = outs[9:8];
assign memrq    = outs[7];
assign rnw      = outs[6];
assign nextexft = outs[5];
assign idx_en   = outs[4];
assign csel     = outs[3];
assign idxce    = outs[2];
assign idxoe    = outs[1];
assign dsel     = outs[0];


always @(negedge clk or posedge reset) begin
if (reset) exft <= 1'b1;
else exft <= nextexft;
end

always @(negedge clk or posedge reset) begin
if (reset) sort_en <= 1'b0;
else if(opcode == `BUBIDX) sort_en <= 1;
else sort_en <= 0;
end


endmodule
