/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: half_adder.v

Description	: Half Adder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module half_adder(a, b, sum, carry);

	//Defining the input and output ports
	input a, b;
	output sum, carry;

	//Assign the output ports with the required logic using data-flow abstraction
	assign sum = a^b;
	assign carry = a&b;

endmodule
