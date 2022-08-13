`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:31:28 02/20/2022
// Design Name:   Moore
// Module Name:   C:/Users/kariu/Documents/Spring 2022/CDA4203L/Projects/Lab4/FSMoore_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Moore
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSMoore_tb;

	// Inputs
	reg clk;
	reg reset;
	reg nickel;
	reg dime;
	reg qtr;
	reg soda;
	reg diet;

	// Outputs
	wire change;
	wire status;
	wire GiveDiet;
	wire GiveSoda;

	// Instantiate the Unit Under Test (UUT)
	Moore uut (
		.clk(clk), 
		.reset(reset), 
		.nickel(nickel), 
		.dime(dime), 
		.qtr(qtr), 
		.change(change), 
		.status(status), 
		.soda(soda), 
		.diet(diet), 
		.GiveDiet(GiveDiet), 
		.GiveSoda(GiveSoda)
	);

	always begin
	clk = 1'b0;
	#50;
	clk = 1'b1;
	#50;
	end
	
	initial begin
//Each Test case here is going to run 2 inputs below 45c 
//and 2 inputs above or equal 45c, both for soda and diet inputs
//To run, just uncomment the test case you want to run in the 'initial begin' section
//DO NOT COMMENT OUT THE INITIALIZATION SECTION

//INITIALIZATION
		  clk = 0;
        reset = 0;
        nickel = 0;
        dime = 0;
        qtr = 0;
        soda = 0;
        diet = 0;

/*/test case 1a => Soda, 35c --- okay


        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
	     soda=1;
        qtr=0;
        dime=0;
        nickel=0;
		  
        #100;
        qtr=0;
        dime=1;
        nickel=0;
		  
        #100;
        dime=1;
        nickel=0;
        qtr=0;
		  
        #100;
        dime=1;
        nickel=0;
        qtr=0;
		  
		  #100;
        dime=0;
        nickel=1;
        qtr=0;
		  
		  #100;
        dime=0;
        nickel=0;
        qtr=0;

//test case 1b -> Soda, 20c --okay

        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  soda=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;

//test case 1c -> Soda, 45c ---okay
	
        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  soda=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=1;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;



//test case 1d -> Soda, 65c ---okay
        
        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  soda=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=1;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;

//test case 2a -> Diet, 15c ---okay

        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  diet=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=0;
        nickel=1;
        
		  #100;
		  qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;

       
//test case 2b -> Diet, 40c ---okay

        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  diet=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;
        

//test case 2c -> Diet, 60c ---okay

        #50;
        reset=1;
        #50;
        reset=0;
        #50;
	
		  diet=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=1;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=1;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;
*/
//test case 2d -> Diet, 55c -----okay

        #50;
        reset=1;
        #50;
        reset=0;
        #50;
		  
		  diet=1;
        qtr=0;
        dime=0;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        qtr=0;
        dime=1;
        nickel=0;
        
		  #100;
        dime=1;
        nickel=0;
        qtr=0;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=1;
        
		  #100;
        dime=0;
        nickel=0;
        qtr=0;

    end

endmodule

