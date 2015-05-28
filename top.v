`timescale 1ns/1ps
module top(
	input wire clk,
	input wire [7:0]addr,
	output reg[7:0]anode,
	output reg[7:0]segment
	);
	reg[7:0] PC;
	wire[31:0] Instruction;
	
	//outputs of Control Center
	wire RegWrite;
	wire RegDest;
	wire ALUsrc;
	wire Branch;
	wire MemToReg;
	wire MemWrite;
	wire MemRead;
	wire Jump;
	wire op;
	
	//output of RegFile
	wire[31:0] Rdata1;
	wire[31:0] Rdata2;
	
	//output of the ALU
	wire[31:0] ALUres;
	wire ALUzero;
	
	
	//output of mem2
	wire[31:0] memRdata;
	
	//output of Ext
	wire [31:0]extended;
	
	
	//output of mux
	wire [4:0]RegWriteAddf;  //mux0
	wire [31:0] ALUsource;   //mux1
	wire [31:0] MemToRegData; //mux2
	
	
	
	initial begin
		PC<=0;
	end
	
	
	
	
	
	mem1 memory0(clk,PC,Instruction);
	ControlCenter CC(Instruction[31:26],RegWrite, RegDest, ALUsrc, Branch, MemToReg, MemWrite, MemRead,Jump,op);
	mux2to1b5 mux0(Instruction[20:16],Instruction[15:11],RegDest,RegWriteAddr);
	RegFile RF(clk,RegWrite,Instruction[25:21],Instruction[20:16],RegWriteAddr,MemToRegData,Rdata1,Rdata2);
	mux2to1b32 mux1(Rdata2,extended,ALUsrc,ALUsource);
	ALU alu0(Rdata1,ALUsource,op,ALUres,ALUzero);
	mem2 memory1(clk,MemWrite, MemRead,ALUres,memRdata,Rdata2);
	mux2to1b32 mux2(ALUres,memRdata,MemToReg,MemToRegData);
	Ext ext0(Instruction[15:0],extended);
	
	
endmodule