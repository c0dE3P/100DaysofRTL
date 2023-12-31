/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux4to1.v

Description	: 4:1 Multiplexer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux4to1(in0, in1, in2, in3, sel0, sel1, out);

	//Defining the input and output ports
	input in0, in1, in2, in3, sel0, sel1;
	output out;
	
	//Defining the internal wires
	wire w1, w2;
	
	//Instantiating the 2:1 multiplexers using named-based port mapping
	mux2to1 MUX1(.in0(w1), .in1(w2), .sel(sel1), .out(out));
	mux2to1 MUX2(.in0(in0), .in1(in1), .sel(sel0), .out(w1));
	mux2to1 MUX3(.in0(in2), .in1(in3), .sel(sel0), .out(w2));

endmodule