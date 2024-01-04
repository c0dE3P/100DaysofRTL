/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: full_adder.v

Description	: Full Adder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module full_adder(a, b, c_in, sum, c_out);

	//Defining the input and output ports
	input a, b, c_in;
	output sum, c_out;

	//Defining the internal wires
	wire w1, w2, w3;

	//Instantiating the half adders using named-based port mapping
	half_adder HA1(.a(a), .b(b), .sum(w1), .carry(w2));
	half_adder HA2(.a(w1), .b(c_in), .sum(sum), .carry(w3));

	//Instantiating the OR gate
	or OR(c_out, w2, w3);

endmodule