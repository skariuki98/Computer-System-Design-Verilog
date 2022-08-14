`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:13 03/04/2022 
// Design Name: 
// Module Name:    GCD4bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GCD_datapath(lt,neq,ldA,ldB,selA,selB,ld_D,data_A,data_B,data_D,clk, reset);

	input ldA,ldB,selA,selB,ld_D,clk, reset;
	input [3:0] data_A;
	input [3:0] data_B;
	output [3:0] data_D;
	
	output lt,neq;
	wire [3:0] MUX_A_OUT,MUX_B_OUT, FlipFlopA_OUT,FlipFlopB_OUT,updateA,updateB; 
	
	
	DFLIPFLOP A (.d_out(FlipFlopA_OUT),
					.d_in(MUX_A_OUT),
					.ld(ldA),
					.clk(clk), 
					.reset(reset));
	DFLIPFLOP B (.d_out(FlipFlopB_OUT),
					.d_in(MUX_B_OUT),
					.ld(ldB),
					.clk(clk), 
					.reset(reset));
	DFLIPFLOP D (.d_out(data_D),
					.d_in(FlipFlopA_OUT),
					.ld(ld_D),
					.clk(clk), 
					.reset(reset));
					
	MUX MUX_in1(.out(MUX_A_OUT),.a(data_A),.b(updateA), .sel(selA));
	MUX MUX_in2(.out(MUX_B_OUT),.a(data_B),.b(updateB),.sel(selB));
	SUB XminusY (.diff(updateA), .x(FlipFlopA_OUT), .y(FlipFlopB_OUT));
	SUB YminusX (.diff(updateB),.x(FlipFlopB_OUT), .y(FlipFlopA_OUT));
	COMPARE COMP (.lt(lt),.neq(neq),.d1(FlipFlopA_OUT),.d2(FlipFlopB_OUT));
	
endmodule 






