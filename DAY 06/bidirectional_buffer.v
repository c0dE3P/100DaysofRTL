/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: bidirectional_buffer.v

Description	: Bidirectional Buffer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module bidirectional_buffer(a, b, ctrl);

	//Define the ports of the bidirectional buffer
	inout a, b;
	input ctrl;
	
	//Logic for the bidirectional buffer
	bufif1 b1(b,a,ctrl); //For control signal 0, port a acts as input and port b as output
	bufif0 b2(a,b,ctrl); //For control signal 1, port b acts as input and port a as output

endmodule
