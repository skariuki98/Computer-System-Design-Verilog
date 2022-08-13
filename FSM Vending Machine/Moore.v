`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:08 02/16/2022 
// Design Name: 
// Module Name:    Moore 
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
module Moore(clk, reset, nickel, dime, qtr, change, status, soda, diet, GiveDiet, GiveSoda);
	
	input nickel, dime, qtr,soda,diet;
	input clk;
	input reset;
	output reg GiveSoda;
	output reg GiveDiet;
	output reg change;
	output reg status;
	

	 //states - 14 different states worst case
	parameter s0 = 4'b0000; //0
	 parameter s1 = 4'b0001; //5
	 parameter s2 = 4'b0010; //10
	 parameter s3 = 4'b0011; //15
	 parameter s4 = 4'b0100; //20
	 parameter s5 = 4'b0101; //25
	 parameter s6 = 4'b0110;//30
	 parameter s7 = 4'b0111; //35
	 parameter s8 = 4'b1000;//40
	 parameter s9 = 4'b1001; //45
	 parameter s10 = 4'b1010;//50
	 parameter s11 = 4'b1011;//55
	 parameter s12 = 4'b1100;//60
	 parameter s13 = 4'b1101; //65
	
	 
	 (*FSM_ENCODING = "SEQUENTIAL", SAFE_IMPLEMENTATION = "NO"*)
	 reg [3:0] state , next_state;
	 
	 always @( posedge clk  or posedge reset) begin
		if (reset==1) 
			state = s0;
		else 
			state=next_state;
		end
			
			
			
			
				 
			
			always@(nickel or dime or qtr or state) begin
			
			(*FULL_CASE, PARALLEL_CASE*) case (state)
				s0 : begin
					
					if(nickel==1)
						next_state = s1;
					else if (dime==1)
						next_state = s2;
					else if (qtr==1)
						next_state = s5;
					else
						next_state = s0;
						
					end
				s1 : begin
					
					if(nickel==1)
						next_state = s2;
					else if (dime==1)
						next_state = s3;
					else if (qtr==1)
						next_state = s6;
					else
						next_state = s1;
						
					end
				s2 : begin
					
					if(nickel==1)
						next_state = s3;
					else if (dime==1)
						next_state = s4;
					else if (qtr==1)
						next_state = s7;
					else
						next_state = s2;
						
					end
				s3 : begin
					
					if(nickel==1)
						next_state = s4;
					else if (dime==1)
						next_state = s5;
					else if (qtr==1)
						next_state = s8;
					else
						next_state = s3;
						
					end
				s4 : begin
					
					if(nickel==1)
						next_state = s5;
					else if (dime==1)
						next_state = s6;
					else if (qtr==1)
						next_state = s9;
					else
						next_state = s4;
						
					end
				s5 : begin
					
					if(nickel==1)
						next_state = s6;
					else if (dime==1)
						next_state = s7;
					else if (qtr==1)
						next_state = s10;
					else
						next_state = s5;
						
					end
				s6 : begin
					
					if(nickel==1)
						next_state = s7;
					else if (dime==1)
						next_state = s8;
					else if (qtr==1)
						next_state = s11;
					else
						next_state = s6;
						
					end
				s7 : begin
					
					if(nickel==1)
						next_state = s8;
					else if (dime==1)
						next_state = s9;
					else if (qtr==1)
						next_state= s12;
					else
						next_state =s7;
						
					end
				s8 : begin
					
					if(nickel==1)
						next_state = s9;
					else if (dime==1)
						next_state = s10;
					else if (qtr==1)
						next_state = s13;
					else
						next_state = s8;
						
					end
				s9 : begin
					
					
					next_state=s0;
					end
				s10 : begin
					
					next_state=s9;
					
					end
				s11 : begin
					
					next_state=s10;
					end
				s12 : begin
						
					next_state=s11;
					end
				s13 : begin
					
					next_state=s12;
					end
			
				default :  begin 
							  next_state = s0;
							  end
									
									
				
				
			endcase
			end
			
			
			always@(state or soda or diet)
			begin
			case(state)
			s0: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s1:begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s2: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s3:begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
						end
			s4: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s5: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s6: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s7: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s8: begin GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			s9: begin 
			     if(soda==1) 
				  GiveSoda = 1;
				  else GiveSoda = 0; 
				  if(diet==1) 
				  GiveDiet = 1;
				  else GiveDiet = 0;
				  change = 0;
				  status = 1;
					end 
			s10: begin 
				if(soda==1) 
				  GiveSoda = 1; 
				  else GiveSoda = 0;
				  if(diet==1) 
				  GiveDiet = 1; 
				  else GiveDiet = 0;
				  change = 1;
				  status = 1;
					end 
			s11: begin
				  if(soda==1) 
				  GiveSoda = 1;
				  else GiveSoda = 0;
				  if(diet==1) 
				  GiveDiet = 1;
				  else GiveDiet = 0;
				  change = 1;
				  status = 1;
					end 
			s12: begin
				if(soda==1) 
				  GiveSoda = 1; 
				  else GiveSoda = 0;
				  if(diet==1)
				  GiveDiet = 1; 
				  else GiveDiet = 0;
				  change = 1;
				  status = 1;
					end 
			s13:begin 
				  if(soda==1)
				  GiveSoda = 1; 
				  else GiveSoda = 0;
				  if(diet==1) 
				  GiveDiet = 1; 
				  else GiveDiet = 0;
				  change = 1;
				   status = 1;
					end 
			default: begin
					GiveSoda = 0;
					GiveDiet = 0;
					change = 0;
					status = 0;
					end
			endcase
			end 



					
			
endmodule 
