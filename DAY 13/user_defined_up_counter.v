/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: user_defined_up_counter.v

Description	: User Defined Synchronous Up Counter Design to count from 01100 to 11100

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module user_defined_up_counter(clk, rst, count);

	input clk, rst;
	output reg [4:0] count;
	
	always @(posedge clk)
	begin
		if(rst)
			count <= 5'b01100;
		else begin
			if(count == 5'b11100)
				count <= 5'b01100;
			else
				count <= count + 1'b1;
		end
	end

endmodule
