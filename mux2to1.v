`timescale 1ns/1ps
module mux2to1b5(
	input wire [4:0]A,
	input wire [4:0]B,
	input wire op,
	output wire [4:0]C);
	
	assign C[0]=op?B[0]:A[0];
	assign C[1]=op?B[1]:A[1];
	assign C[2]=op?B[2]:A[2];
	assign C[3]=op?B[3]:A[3];
	assign C[4]=op?B[4]:A[4];
endmodule

module mux2to1b32(
	input wire [31:0]A,
	input wire [31:0]B,
	input wire op,
	output wire [31:0]C);
	
	assign C[0]=op?B[0]:A[0];
	assign C[1]=op?B[1]:A[1];
	assign C[2]=op?B[2]:A[2];
	assign C[3]=op?B[3]:A[3];
	assign C[4]=op?B[4]:A[4];
	assign C[5]=op?B[5]:A[5];
	assign C[6]=op?B[6]:A[6];
	assign C[7]=op?B[7]:A[7];
	
	assign C[8]=op?B[8]:A[8];
	assign C[9]=op?B[9]:A[9];
	assign C[10]=op?B[10]:A[10];
	assign C[11]=op?B[11]:A[11];
	assign C[12]=op?B[12]:A[12];
	assign C[13]=op?B[13]:A[13];
	assign C[14]=op?B[14]:A[14];
	assign C[15]=op?B[15]:A[15];
	
	assign C[16]=op?B[16]:A[16];
	assign C[17]=op?B[17]:A[17];
	assign C[18]=op?B[18]:A[18];
	assign C[19]=op?B[19]:A[19];
	assign C[20]=op?B[20]:A[20];
	assign C[21]=op?B[21]:A[21];
	assign C[22]=op?B[22]:A[22];
	assign C[23]=op?B[23]:A[23];
	
	assign C[24]=op?B[24]:A[24];
	assign C[25]=op?B[25]:A[25];
	assign C[26]=op?B[26]:A[26];
	assign C[27]=op?B[27]:A[27];
	assign C[28]=op?B[28]:A[28];
	assign C[29]=op?B[29]:A[29];
	assign C[30]=op?B[30]:A[30];
	assign C[31]=op?B[31]:A[31];
	
endmodule