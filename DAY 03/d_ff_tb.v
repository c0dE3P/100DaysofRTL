/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: d_ff_tb.v

Description	: D Flipflop Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module d_ff_tb();

	//Defining the input and output ports
	reg clk, rst, d_in;
	wire q, q_bar;
	
	parameter CYCLE = 10;
	
	//Instantiate the D Flipflop
	d_ff DUT(.clk(clk), .rst(rst), .d_in(d_in), .q(q), .q_bar(q_bar));
	
	//Clock generation logic
	always begin
		#(CYCLE/2);
		clk = 1'b0;
		#(CYCLE/2);
		clk = ~clk;
	end
	
	//Reset task
	task reset();
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask
	
	//Data input task
	task data_in(input i);
		begin
			@(negedge clk)
			d_in = i;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial begin
		reset();
		data_in(0);
		data_in(1);
		data_in(0);
		data_in(1);
		data_in(1);
		reset();
		data_in(0);
		data_in(1);
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, D=%b, Output Q=%b, Q_bar=%b", $time,clk,rst,d_in,q,q_bar);

endmodule
