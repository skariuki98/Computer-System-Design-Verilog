`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:19 02/19/2022 
// Design Name: 
// Module Name:    L4_boardtest 
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
module L4_boardtest(SW, BTN, clk, LED);
	
	input [7:0] SW;		
	output [7:0] LED;
	input [3:0] BTN;
	input clk;

	

	wire slow_clk;
	wire n, d, qt;
	
	
	clock_divider cd (.clk(clk), .rst(SW[0]), .clk_div(slow_clk));
	
	debouncer 	d1 (.clk(clk), .clock_div(slow_clk), .in(BTN[1]), .out(n));
	debouncer 	d2 (.clk(clk), .clock_div(slow_clk), .in(BTN[2]), .out(d));
	debouncer 	d3 (.clk(clk), .clock_div(slow_clk), .in(BTN[3]), .out(qt));
	
	assign LED[2:0] = SW[2:0];
	
	Moore FSM_vending (.clk(slow_clk), .reset(SW[0]), .nickel(n), .dime(d), .qtr(qt), .soda(SW[1]), .diet(SW[2]),
							 .change(LED[4]), .status(LED[5]), .GiveSoda(LED[6]), .GiveDiet(LED[7]));

endmodule
