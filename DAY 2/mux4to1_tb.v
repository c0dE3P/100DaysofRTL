/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux4to1_tb.v

Description	: 4:1 Multiplexer Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux4to1_tb();

	//Declaring the input and output ports for Testbench
	reg in0, in1, in2, in3, sel0, sel1;
	wire out;
	
	//Declaring variable for loop iteration
	integer i;

	//Instantiate the multiplexer with name based order port mapping
	mux4to1 DUT(.in0(in0), .in1(in1), .in2(in2), .in3(in3), .sel0(sel0), .sel1(sel1), .out(out));
	
	//Process to initialize inputs at 0ns
	initial begin
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		sel0 = 0;
		sel1 = 0;
	end
	
	//Process to generate stimulus using for loop
	initial 
	begin
		for(i=0;i<(2**6); i=i+1)
		begin
			{in0,in1,in2,in3,sel0,sel1}=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial $monitor("Time=%t, Input in0=%b, in1=%b, in2=%b, in3=%b, sel0=%b, sel1=%b, Output out=%b", $time, in0, in1, in2, in3, sel0, sel1, out);
	
	//Process to terminate simulation
	initial	
		#640 $finish;

endmodule