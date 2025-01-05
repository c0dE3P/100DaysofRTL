/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: bcd2xs3converter.v

Description	: BCD to XS3 Converter using 4:10 Decoder

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module bcd2xs3converter(input [3:0] b_in, output [3:0] x_out);

	wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9;

	decoder410 DEC(.in(b_in), .out({w9,w8,w7,w6,w5,w4,w3,w2,w1,w0}));
	or OR1(x_out[0], w0,w2,w4,w6,w8);
	or OR2(x_out[1], w0,w3,w4,w7,w8);
	or OR3(x_out[2], w1,w2,w3,w4,w9);
	or OR4(x_out[3], w5,w6,w7,w8,w9);

endmodule