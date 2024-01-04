/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: decoder_3to8.v

Description	: 3 to 8 Decoder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module decoder_3to8(en, in2, in1, in0, y7, y6, y5, y4, y3, y2, y1, y0);

	//Defining the input and output ports
	input en, in2, in1, in0;
	output y7, y6, y5, y4, y3, y2, y1, y0;
	
	//Instantiating the 2:4 decoders using named-based port mapping
	decoder_2to4 D0(.en(en), .in1(in1), .in0(in0), .y3(y3), .y2(y2), .y1(y1), .y0(y0));
	decoder_2to4 D1(.en(en), .in1(1'b0), .in0(in2), .y3(y7), .y2(y6), .y1(y5), .y0(y4));

endmodule

