/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: ripple_carry_adder.v

Description	: Ripple Carry Adder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module ripple_carry_adder(a0, a1, a2, a3, b0, b1, b2, b3, carry_in, sum0, sum1, sum2, sum3, carry_out);

	//Defining the input and output ports
	input a0, a1, a2, a3, b0, b1, b2, b3, carry_in;
	output sum0, sum1, sum2, sum3, carry_out;

	//Defining the internal wires
	wire c1, c2, c3;

	//Instantiating the half adders using named-based port mapping
	full_adder FA0(.a(a0), .b(b0), .c_in(carry_in), .sum(sum0), .c_out(c1));
	full_adder FA1(.a(a1), .b(b1), .c_in(c1),  .sum(sum1), .c_out(c2));
	full_adder FA2(.a(a2), .b(b2), .c_in(c2),  .sum(sum2), .c_out(c3));
	full_adder FA3(.a(a3), .b(b3), .c_in(c3),  .sum(sum3), .c_out(carry_out));

endmodule
