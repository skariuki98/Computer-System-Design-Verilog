`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(clk ,rst, clk_div  );

input clk;
input rst;
output reg clk_div;

localparam constantNumber = 26'd25000000;

reg [25:0] count;

initial
begin
	count = 26'd0; //set counter to 0
end
 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        count <= 26'b0; //set counter to 0
    else if (count == constantNumber - 1) //reset counter
        count <= 26'b0;
    else
        count <= count + 26'd1; //increment counter
end

always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        clk_div <= 1'b0; //reset ckl_div to 0
    else if (count == constantNumber - 1)
        clk_div <= ~clk_div; //if at end of count,invert clk_div value
    else
        clk_div <= clk_div; //if reset is not 1 and count is not at end, clk_div remains constant 0 as per observation
end

endmodule
