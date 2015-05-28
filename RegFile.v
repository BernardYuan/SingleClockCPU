`timescale 1ns/1ps
module RegFile(
	input wire clk,
	input wire RegWrite,
	input wire [4:0] R1,
	input wire [4:0] R2,
	input wire [4:0] W1,
	input wire [31:0] WData1,
	output reg [31:0] RDate1,
	output reg [31:0] RData2
	);
	
	reg[31:0] Regs[31:0];
	
	//still need to determine the eventual depth of the memory
	//initial begin
	//	Regs[29]<=32'dXXX;
	//end
	
	always@(posedge clk) begin
		if(RegWrite) begin
			Regs[W1]<=WData1;
		end
		RData1<=Regs[R1];
		RData2<=Regs[R2];
	end
endmodule