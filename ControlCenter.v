`timescale 1ns/1ps
module ControlCenter(
	input wire [5:0]in,
	output wire RegWrite,
	output wire RegDest,
	output wire ALUsrc,
	output wire Branch,
	output wire MemToReg,
	output wire MemWrite,
	output wire MemRead,
	output wire Jump,
	output wire minus);
	
	wire[1:0] RegWrite1;
	wire[1:0] ALUsrc1;
	wire [5:0]in_out;
	
	not(in_out[0],in[0]);
	not(in_out[1],in[1]);
	not(in_out[2],in[2]);
	not(in_out[3],in[3]);
	not(in_out[4],in[4]);
	not(in_out[5],in[5]);
	
	and(RegWrite1[0],in_out[5],in_out[4],in_out[3],in_out[2],in_out[1],in_out[0]);
	and(RegWrite1[1],in[5],in_out[4],in_out[3],in_out[2],in[1],in[0]);
	or(RegWrite,RegWrite1[0],RegWrite1[1]);
	
	and(RegDest,in_out[5],in_out[4],in_out[3],in_out[2],in_out[1],in_out[0]);
	
	and(ALUsrc1[0],in[5],in_out[4],in_out[3],in_out[2],in[1],in[0]);
	and(ALUsrc1[1],in[5],in_out[4],in[3],in_out[2],in[1],in[0]);
	or(ALUsrc,ALUsrc1[0],ALUsrc1[1]);
	
	and(Branch,in_out[5],in_out[4],in_out[3],in[2],in_out[1],in_out[0]);
	
	and(MemToReg,in[5],in_out[4],in_out[3],in_out[2],in[1],in[0]);
	
	and(MemWrite,in[5],in_out[4],in[3],in_out[2],in[1],in[0]);
	
	and(MemRead,in[5],in_out[4],in_out[3],in_out[2],in[1],in[0]);
	
	and(Jump,in_out[5],in_out[4],in_out[3],in_out[2],in[1],in_out[0]);
	
	and(minus,in_out[5],in_out[4],in_out[3],in[2],in_out[1],in_out[0]);
endmodule