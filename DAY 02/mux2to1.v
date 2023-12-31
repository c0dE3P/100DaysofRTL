/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux2to1.v

Description	: 2:1 Multiplexer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux2to1(in0,in1,sel,out);

	//Defining the input and output ports
	input in0, in1, sel;
	output out;
	
	//Assign the output ports with the required logic using data-flow abstraction
	assign out = sel ? in1 : in0;
	
	//Assign the output ports with the required logic using blocking assignment and switch-case
	/*always @(*)
	begin
		case(sel)
			1'b0: out = in0;
			1'b1: out = in1;
			default: out = 1'b0;
		endcase
	end*/
	
endmodule