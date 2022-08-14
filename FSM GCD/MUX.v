`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:31 03/10/2022 
// Design Name: 
// Module Name:    MUX 
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
module MUX (out,a,b,sel);
	input [3:0] a,b;
	input sel;
	output reg[3:0] out;
	
	always @(a or b or sel) begin
		case (sel) 
			1'b0: out = a;
			1'b1: out = b;
			default: out = 4'bz;
		endcase
		end
endmodule 

