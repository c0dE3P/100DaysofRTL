/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: odd_even_counter.v

Description	: Even and Odd Counter Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module ring_counter #(parameter WIDTH = 4)(
	input clk, rst,
	output reg [(WIDTH-1):0] count
	);
	
	reg temp;
	
	always @(posedge clk or negedge rst)
	begin
		if(rst)
			count = 4'b0001;
		else begin
			temp = count[0];
			count = count>>1;
			count[WIDTH-1] = temp;
		end
	end

endmodule
