`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:22 03/10/2022 
// Design Name: 
// Module Name:    DFLIPFLOP 
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
module DFLIPFLOP (d_out,d_in, ld, clk, reset);

	input [3:0] d_in;
	input ld,clk, reset;
	output reg [3:0] d_out = 4'd0;
	
	
	always @(posedge clk) begin
		if (reset && !ld) begin
			d_out = 0; end
		else if(ld && !reset) begin
			d_out=d_in; end
		else begin d_out = d_out; end
	end
endmodule


