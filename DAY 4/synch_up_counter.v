/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: synch_up_counter.v

Description	: 4-bit Synchronous Loadable Up Counter Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module synch_up_counter(clk,rst,ld,data,count);

	//Defining the input and output ports
	input clk,rst,ld;
	input [3:0] data;
	output reg [3:0] count;

	//Logic for 4-bit synchronous loadable up counter
	always @(posedge clk)
	begin
		if(rst)
			count <= 4'd0; //Resetting the output when reset port is active
		else if(ld)
			count <= data; //Loading data to counter output when load port is active
		else
			count <= count+1'b1; //Counter increment when neither reset nor load is active
	end

endmodule
