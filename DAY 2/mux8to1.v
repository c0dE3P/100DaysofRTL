/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux8to1.v

Description	: 8:1 Multiplexer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux8to1(in0,in1,in2,in3,in4,in5,in6,in7,sel0,sel1,sel2,out);

	//Defining the input and output ports
	input in0,in1,in2,in3,in4,in5,in6,in7,sel0,sel1,sel2;
	output out;
	
	//Definign the internal wires
	wire w1, w2;
	
	//Instantiating the 4:1 multiplexers using named-based port mapping
	mux4to1 MUX1(.in0(w1), .in1(w2), .in2(1'b0), .in3(1'b0), .sel0(sel2), .sel1(1'b0), .out(out));
	mux4to1 MUX2(.in0(in0), .in1(in1), .in2(in2), .in3(in3), .sel0(sel0), .sel1(sel1), .out(w1));
	mux4to1 MUX3(.in0(in4), .in1(in5), .in2(in6), .in3(in7), .sel0(sel0), .sel1(sel1), .out(w2));

endmodule