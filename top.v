`timescale 1ns/1ps
module top(
	input wire clk,
	input wire [7:0]addr,
	output reg[7:0]anode,
	output reg[7:0]segment
	);
	//wire about PC
	reg[31:0] PC;
	reg[31:0] PCout;
	wire[31:0] PCwire;
	wire [31:0] PCplus4;
	
	//the Instruction
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
	wire [31:0]BranchAddr;
	
	
	//output of mem2
	wire[31:0] memRdata;
	
	//output of Ext
	wire [31:0]extended;
	
	//output of mux
	wire [4:0]RegWriteAddf;  //mux0
	wire [31:0] ALUsource;   //mux1
	wire [31:0] MemToRegData; //mux2
	wire [31:0] BraOrPlus4;
	
	//output of shifting module
	wire [31:0] BranchImme;
	
	//control signal of the branch statements
	wire BrachMux;
	
	//26bits addressing
	wire [31:0]JumpAddr0;
	wire [31:0]JumpAddr1;
	
	//Eventual Address
	wire [31:0] FinalAddr;
	
	initial begin
		PC<=0;
	end
	always@(posedge clk) begin
		PCout<=PC;
	end
	assign PCwire = PCout;
	assign PCplus4=PCwire+32'd4;
	
	mem1 memory0(clk,PCwire,Instruction);
	ControlCenter CC(Instruction[31:26],RegWrite, RegDest, ALUsrc, Branch, MemToReg, MemWrite, MemRead,Jump,op);
	mux2to1b5 mux0(Instruction[20:16],Instruction[15:11],RegDest,RegWriteAddr);
	RegFile RF(clk,RegWrite,Instruction[25:21],Instruction[20:16],RegWriteAddr,MemToRegData,Rdata1,Rdata2);
	mux2to1b32 mux1(Rdata2,extended,ALUsrc,ALUsource);
	ALU alu0(Rdata1,ALUsource,op,ALUres,ALUzero);
	mem2 memory1(clk,MemWrite, MemRead,ALUres,memRdata,Rdata2);
	mux2to1b32 mux2(ALUres,memRdata,MemToReg,MemToRegData);
	Ext ext0(Instruction[15:0],extended);
	slfb2 slf0(extended, BranchImme);
	CLA32bits cla32b0(.A(PCplus4),.B(BranchImme),.op(0),.sum(BranchAddr));
	and(BranchMux,ALUzero,Branch);
	mux2to1b32 mux3(PCplus4, BranchAddr,BranchMux,BraOrPlus4);
	slfb2 slf1(Instruction[25:0],JumpAddr0);
	assign JumpAddr1={Instruction[31,28],JumpAddr0[27:0]};
	mux2to1b32 mux4(BraOrPlus4,JumpAddr1,Jump,FinalAddr);
	
	always@* begin
		PC<=FinalAddr;
	end
	
	
	
endmodule