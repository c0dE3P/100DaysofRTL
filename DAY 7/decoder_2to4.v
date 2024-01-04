/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: decoder_2to4.v

Description	: 2 to 4 Decoder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module decoder_2to4(en, in1, in0, y3, y2, y1, y0);

	//Defining the input and output ports
	input en, in1, in0;
	output y3, y2, y1, y0;
	
	//Assigning the output ports with the required logic
	assign y3 = en ? in1 & in0 : 1'bz;
	assign y2 = en ? in1 & ~in0 : 1'bz;
	assign y1 = en ? ~in1 & in0 : 1'bz;
	assign y0 = en ? ~in1 & ~in0 : 1'bz;

endmodule
