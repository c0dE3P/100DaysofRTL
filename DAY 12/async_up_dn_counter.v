/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: async_up_dn_counter.v

Description	: 4-bit Binary Up/Down Counter Design with Asynchronous Reset

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module async_up_dn_counter(clk,rst,up_dn,count);
	
	//Defining the input and output ports
	input clk, rst, up_dn;
	output reg [3:0] count;
	
	//Logic for 4-bit binary up/down counter with asynchronous reset 
	always @(posedge clk or negedge rst)
	begin
		if(rst)
			count <= 4'b0000;
		else 
		begin
			if(up_dn)
				count <= count+1'b1;
			else
			 count <= count-1'b1;
		end
	end
	
endmodule

