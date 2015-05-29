`timescale 1ns/1ps
module sflb2(
	input wire [31:0]in,
	output wire [31:0]out);
	
	assign out= in<<2;
endmodule