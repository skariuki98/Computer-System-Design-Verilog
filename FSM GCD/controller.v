`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:55 03/10/2022 
// Design Name: 
// Module Name:    controller 
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
module controller (ldA,ldB,selA,selB,ld_D,clk,lt,neq,start,done);
	
	input clk,lt,neq,start;
	output reg ldA,ldB,selA,selB,ld_D,done;

	
	localparam S0=4'b0000 ,S1=4'b0001 ,S2=4'b0010 ,S3=4'b0011 ,S4=4'b0100 ,S5=4'b0101 , S6 = 4'b0110,
					S7 = 4'b0111, 
					S8 = 4'b1000,
					S9 = 4'b1001,
					S10 = 4'b1010,
					S11 = 4'b1011,
					S12 = 4'b1100
					;
	reg [3:0]state = S0;
	
	always @ (posedge clk ) 
		begin 
		
		case(state)
			S0: begin
				state = S1;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b0;
				//done = 1'b0;
			end
			S1:begin
				if(start == 1'b0)begin
					state = S2;
					done = 1'b0;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
				if(start == 1'b1)begin
					state = S3;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
			end
			S2:begin
				state = S1;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
			S3:begin
				state = S4;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b1;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
			S4:begin
				state = S5;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b1;
				ld_D = 1'b0;
			end
			S5:begin
				if(neq == 1'b0)begin
					state = S11;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
				if(neq == 1'b1)begin
					state = S6;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
			end
			S6:begin
				if(lt == 1'b0)begin
					state = S8;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
				else if(lt == 1'b1)begin
					state = S7;
					selA = 1'b0;
					selB = 1'b0;
					ldA = 1'b0;
					ldB = 1'b0;
					ld_D = 1'b0;
				end
			end
			S7:begin
				state = S9;
				selA = 1'b0;
				selB = 1'b1;
				ldA = 1'b0;
				ldB = 1'b1;
				ld_D = 1'b0;
			end
			S8:begin
				state = S9;
				selA = 1'b1;
				selB = 1'b0;
				ldA = 1'b1;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
			S9:begin
				state = S10;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
			S10:begin
				state = S5;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
			S11:begin
				state = S12;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b1;
			end
			S12:begin
				state = S0;
				done = 1'b1;
				selA = 1'b0;
				selB = 1'b0;
				ldA = 1'b0;
				ldB = 1'b0;
				ld_D = 1'b0;
			end
		endcase
		
	
	end
endmodule
