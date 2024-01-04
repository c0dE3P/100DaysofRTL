/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: comparator.v

Description	: 4-bit Comparator Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module comparator(a, b, gt, lt, eq);

	//Defining the input and output ports
	input [3:0] a, b;
	output gt, lt, eq;
	
	//Assigning the output ports with the required logic
	assign gt = a>b ? 1'b1 : 1'b0;
	assign lt = a<b ? 1'b1 : 1'b0;
	assign eq = a==b ? 1'b1 : 1'b0;

endmodule
