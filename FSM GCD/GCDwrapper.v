`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:46 03/10/2022 
// Design Name: 
// Module Name:    GCDwrapper 
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
module GCDwrapper(data_A, data_B, data_D, clk, reset, done, start);
input [3:0] data_A, data_B;
input clk, reset, start;
output [3:0] data_D;
output done;

wire lessthan, NEQ, loadA, loadB, sa, sb, loadD;

GCD_datapath DP(.lt(lessthan),
						.neq(NEQ),
						.ldA(loadA),
						.ldB(loadB),
						.selA(sa),
						.selB(sb),
						.ld_D(loadD),
						.data_A(data_A),
						.data_B(data_B),
						.data_D(data_D),
						.clk(clk), 
						.reset(reset));
						
controller CN(.ldA(loadA),
					.ldB(loadB),
					.selA(sa),
					.selB(sb),
					.ld_D(loadD),
					.clk(clk),
					.lt(lessthan),
					.neq(NEQ),
					.start(start),
					.done(done));


endmodule
