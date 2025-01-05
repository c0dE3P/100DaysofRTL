
/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: parity_generator_tb.v

Description	: Even and Odd Parity Generator Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module parity_generator_tb();

	parameter DATA_LENGTH = 4;
	
	//Declaring the input and output ports for Testbench
	reg [(DATA_LENGTH-1):0] in;
	wire parity_even, parity_odd;
	
	//Declaring variable for loop iteration
	integer i;
	
	//Instantiate the multiplexer with name based order port mapping
	parity_generator DUT(.in(in), .parity_even(parity_even), .parity_odd(parity_odd));
	
	//Process to initialize inputs at 0ns
	initial begin
		in=4'b0000;
	end
	
	//Process to generate stimulus using for loop
	initial begin
		for(i=0; i<16; i=i+1)
		begin
			in=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial $monitor("Time=%t ns, Input A=%b, Even Parity=%b, Odd Parity=%b", $time, in, parity_even, parity_odd);
	
	//Process to terminate simulation
	initial #160 $finish;
	
endmodule