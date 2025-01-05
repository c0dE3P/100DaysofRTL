/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: freq_divide_tb.v

Description	: Frequency Divide By N Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

`timescale 1ns/1ns;

module freq_divide_tb();

	reg clk, rst;
	wire q_out;

	parameter CYCLE = 10;

	freq_divide DUT(clk, rst, q_out);

	always begin
		#(CYCLE/2) clk = 1'b0;
		#(CYCLE/2) clk = ~clk;
	end

	task reset();
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask

	task divide();
		begin
			//repeat(100)
			@(posedge clk or negedge clk)
			rst = 1'b0;
		end
	endtask

	initial begin
		reset();
		repeat(50)
			divide();
		/*divide();
		divide();
		divide();
		divide();
		divide();
		divide();
		divide();
		divide();
		divide();*/
		#10;
		$finish();
	end

endmodule
