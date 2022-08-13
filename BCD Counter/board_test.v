`timescale 1ns / 1ps

module board_test(LED, SW, CLK);

output [7:0] LED;
input [7:0] SW;
input CLK;

bcd_count_7 bcd_ctr(SW[6:0], SW[7], CLK, LED[7:4], LED[3:0]);

endmodule
