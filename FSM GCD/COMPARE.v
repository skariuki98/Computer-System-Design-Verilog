`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:35 03/10/2022 
// Design Name: 
// Module Name:    COMPARE 
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
module COMPARE (lt,neq,d1,d2);
	input [3:0] d1,d2;
	output lt,neq;
	
	assign lt = (d1<d2) ? 1'b1 : 1'b0;
	assign neq = (d1!=d2) ? 1'b1:1'b0;
	
endmodule
