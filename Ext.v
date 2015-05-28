`timescale 1ns/1ps
module Ext (
	input wire [15:0] in,
	output wire [31:0]out);
	
	assign out=in[15]?{16'hFFFF,in}:{16'h0000,in};
endmodule