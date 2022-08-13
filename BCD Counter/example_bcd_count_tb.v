// Example BCD Counter Testbench
module bcd_count_tb_example;
	
	// Inputs
	reg [6:0] max_count;
	reg clk, run;

	// Outputs
	wire [3:0] digit_1, digit_2;

	// UUT - BCD Counter
	bcd_count_7 uut(.max_count(max_count), .run(run), .CLK(clk), .digit_1(digit_2), .digit_2(digit_1));

	// Clock Generator
	always begin
		clk = ~clk;
		#5;
	end
	
	// Simulation
	initial begin
		clk = 0;
		run = 0;
		max_count = 0;
		#100;
		// Set MAX to 73 while run=0
		max_count = 50;
		#10;
		// Wait, then set run to 1
		run = 1;
		
		// Should count to 99 and stop
		// *** NOTE*** You will need to simulate 3us to see the entire waveform
	end
endmodule
