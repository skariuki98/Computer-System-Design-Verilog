`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:26:45 03/10/2022
// Design Name:   GCDwrapper
// Module Name:   C:/Users/kariu/Documents/Spring 2022/CDA4203L/Labs/Lab5 Material/project_5/project5GCD/GCDtestbench.v
// Project Name:  project5GCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GCDwrapper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GCDtestbench;

	// Inputs
	reg [3:0] data_A;
	reg [3:0] data_B;
	reg clk;
	reg reset;
	reg start;
	

	// Outputs
	wire [3:0] data_D;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	GCDwrapper uut (
		.data_A(data_A), 
		.data_B(data_B), 
		.data_D(data_D), 
		.clk(clk), 
		.reset(reset), 
		.done(done), 
		.start(start)
	);

	always #50 clk=~clk;
	
	initial 
	begin
		#100;
	   clk=1;
	   start=0;
		reset = 1;
		
		#50;
		start = 1;
		reset = 0;
		
		
		
		
		
		//TEST CASES (Uncomment only the section below, for the test case you want to run
		//DO NOT UNCOMMENT ANTHING APART FROM THE BELOW TEST CASES
		/*/test case 1
		 #10 data_A=12;
		 #13 data_B=4;
		 
		 //test case 2
		 #10 data_A=6;
		 #13 data_B=3;
		 */ 
		 //test case 3
		 #10 data_A=15;
		 #13 data_B=5;
		 
		 /*/test case 3
		  data_A=12;
		  data_B=15;	
		 */
			
		
		 
		 
	end
endmodule

