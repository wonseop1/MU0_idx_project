`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/22 16:55:54
// Design Name: 
// Module Name: MU0
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

module mu0 (reset, clk, addr1, data, memrq, rnw);
    input reset, clk;
    inout [15:0] data;
    //output [11:0] addr;
    output [11:0] addr1;
    output memrq, rnw;
    wire [15:0] alu, alu1, ir, pc, b, a, acc, bb;
    wire [1:0] alufs;
    wire [11:0] idx12, addr;
    wire sort_en;
    pc_reg pc_reg(.clk(clk), .pcce(pcce), .alu(alu), .pc(pc));
    ir_reg ir_reg(.clk(clk), .irce(irce), .data(data), .ir(ir));
    mux12bit mux12_asel(.a(ir[11:0]), .b(pc[11:0]), .s(asel), .out(addr));
    
    mux12bit mux12_dsel(.a(idx12), .b(addr), .s(dsel), .out(addr1));
    sort sort(.clk(clk), .reset(sreset), .in(b), .out(bb));
    mux16bit mux16_bsel(.a(data), .b({4'b0000, addr}), .s(bsel), .out(b));
    acc_reg acc_reg(.clk(clk), .accce(accce), .alu(alu), .acc(acc), .acc15(acc15), .accz(accz));
    
    Idx_reg Idx_reg(.clk(clk), .idxce(idxce), .alu12(alu[11:0]), .idx12(idx12));
    mux16bit mux16bit_csel(.a({4'b0000, idx12}), .b(acc), .s(csel), .out(a));
    
    tri16bit tri16(.in(acc), .oe(accoe), .out(data));
    tri16bit tri16_1(.in({4'b0000, idx12}), .oe(idxoe), .out(data));
    tri16bit tri16_idx(.in(bb), .oe(idx_en), .out(alu));
    tri16bit tri16_alu(.in(alu1), .oe(!idx_en), .out(alu));
    
    sync_rst sync_rst(.reset(reset), .clk(clk), .sreset(sreset));
    FA_16bits ALU(.reset(sreset), .a(a), .b(b), .alufs(alufs), .alu(alu1));
    
   //sort sort( .clk(clk), .reset(reset), .idx_en(idx_en), .in1(b), .out(alu));
    
    fsm fsm(.reset(sreset), .clk(clk), .opcode(ir[15:12]), .accz(accz), .acc15(acc15), 
    .asel(asel), .bsel(bsel), .accce(accce), .pcce(pcce), .irce(irce), 
    .accoe(accoe), .alufs(alufs), .memrq(memrq), .rnw(rnw), .idx_en(idx_en), .csel(csel), .idxce(idxce), .idxoe(idxoe), .dsel(dsel));
endmodule
