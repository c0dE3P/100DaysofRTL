
/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: parity_generator.v

Description	: Even and Odd Parity Generator

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module parity_generator(in, parity_even, parity_odd);

	parameter DATA_LENGTH = 4;

	//Defining the input and output ports
	input [(DATA_LENGTH-1):0] in;
	output reg parity_even=0, parity_odd=0;
	
	integer i;
	
	//Logic for even and odd parity generator
	always @(*)
	begin
		parity_even=0;
		parity_odd=0;
		for(i=0; i<DATA_LENGTH; i=i+1)
		begin
			parity_even = parity_even ^ in[i];
			parity_odd = ~parity_even;
		end
	end 
endmodule