/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: clock_gen_tb.v

Description	: Clock Signal Generator Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

//`timescale 1ns/1ns;

module clock_gen_tb();

	reg clk_enb, rst;
	wire clk_out;

	parameter CYCLE = 20;

	clock_gen DUT(clk_enb, rst, clk_out);

	initial begin
		rst = 1'b0;
		clk_enb = 1'b1;
		//forever #(CYCLE/2) clk_enb = ~clk_enb;
		#30 clk_enb = 1'b0;
		#20 clk_enb = 1'b1;
		#10 rst = 1'b1;
		#10 rst = 1'b0;
		#20 clk_enb = 1'b1;
		#30 clk_enb = 1'b0;
		#20 clk_enb = 1'b1;
	end

	initial $monitor($time, " Input CLK_ENB=%0b, Reset=%0b, Output CLK_OUT=%0b",clk_enb,rst,clk_out);

	initial #500 $finish;

endmodule