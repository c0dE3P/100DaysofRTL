/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mod12_up_counter.v

Description	: 4-bit Synchronous Loadable Modulus-12 Up Counter Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mod12_up_counter(clk,rst,ld,data,count);

	//Defining the input and output ports
	input clk,rst,ld;
	input [3:0] data;
	output reg [3:0] count;
	
	//Logic for 4-bit synchronous mod-12 loadable up counter
	always @(posedge clk)
	begin
		if(rst)
		count <= 4'b0000;
		else if(ld)
		begin
			if(data > 4'b1011)
				count <= 4'b0000;
			else
				count <= data;
		end
		else if(count == 4'b1011)
		count <= 4'b0000;
		else
		count <= count+1'b1;
	end
	
endmodule
