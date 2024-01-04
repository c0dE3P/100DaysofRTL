/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: d_ff.v

Description	: D Flipflop Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module d_ff(clk, rst, d_in, q, q_bar);

	//Defining the input and output ports
	input clk, rst, d_in;
	output reg q;
	output q_bar;
	
	//Logic for positive clock edge triggered D Flipflop with asynchronous active low reset
	always @(posedge clk or negedge rst)
	begin
		if(~rst)
			q <= 1'b0;
		else 
			q <= d_in;
	end
		
	assign q_bar = ~q;

endmodule
