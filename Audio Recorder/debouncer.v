`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:57:33 05/02/2022 
// Design Name: 
// Module Name:    debouncer 
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
`timescale 1ns / 1ps

module debouncer(
    input clk,
    input i_btn,
    output reg o_state,
    output o_ondn,
    output o_onup
    );

    // sync with clock and combat metastability
    reg sync_0, sync_1;
    always @(posedge clk) sync_0 <= i_btn;
    always @(posedge clk) sync_1 <= sync_0;

    // 2.6 ms counter at 100 MHz
    reg [18:0] counter;
    wire idle = (o_state == sync_1);
    wire max = &counter;

    always @(posedge clk)
    begin
        if (idle)
            counter <= 0;
        else
        begin
            counter <= counter + 1;
            if (max)
                o_state <= ~o_state;
        end
    end

    assign o_ondn = ~idle & max & ~o_state;
    assign o_onup = ~idle & max & o_state;
endmodule
