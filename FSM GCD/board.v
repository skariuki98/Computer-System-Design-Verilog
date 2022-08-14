`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:20 03/06/2022 
// Design Name: 
// Module Name:    board 
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
module board(CLK, SW, BTN ,LED, LDT2G, DIP_A1);

input CLK;
input [7:0] SW; //input A, B
input DIP_A1; //start
input [3:0]BTN; //BTN0 - reset
output [3:0] LED; //output Data_d
output LDT2G; // done

wire slowCLK, debounced_BTN0;

	clock_divider cd(CLK, BTN[0], slowCLK);
	debouncer db (CLK, slowCLK, BTN[0], debounced_BTN0);
	
	GCDwrapper GCD(SW[3:0], SW[7:4], LED[3:0], CLK, debounced_BTN0, LDT2G, DIP_A1);
	
endmodule
