`timescale 1ns/1ps

module ALU(
	input wire [31:0] A,
	input wire [31:0] B,
	input wire [1:0] op,
	output wire [31:0] res,
	output wire zero
);
	wire sf, cs, of;
	CLA32bits m0(A,B,op[0],res,sf,cf,of);
	nand(zero, res[0],res[1],res[2],res[3], res[4],res[5],res[6],res[7], res[8],res[9],res[10],res[11], res[12],res[13],res[14],res[15], res[16],res[17],res[18],res[19], res[20],res[21],res[22],res[23], res[24],res[25],res[26],res[27], res[28],res[29],res[30],res[31]);
	
endmodule