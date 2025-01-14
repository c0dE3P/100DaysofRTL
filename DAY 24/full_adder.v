/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: full_adder.v

Description	: Full Adder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module full_adder(input a, b, cin, output sum, cout);

	assign sum = a^b^cin;
	assign cout = (a&b)|(b&cin)|(cin&a);

endmodule