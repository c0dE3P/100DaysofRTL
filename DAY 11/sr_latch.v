/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: sr_latch.v

Description	: SR Latch Design using Gate level modelling

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module sr_latch(s,r,q,q_bar);

	//Defining the input and output ports
	input s,r;
	output q,q_bar;

	//Assigning the output ports the required logic
	assign q = ~(r | q_bar);
	assign q_bar = ~(s | q);

endmodule

