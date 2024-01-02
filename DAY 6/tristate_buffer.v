/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: tristate_buffer.v

Description	: Tri State Buffer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module tristate_buffer(in, en, out);

	//Defining the input and output ports
	input in, en;
	output out;
	
	assign out = en ? in : 1'bz; //Assign the output port with the required logic

endmodule
