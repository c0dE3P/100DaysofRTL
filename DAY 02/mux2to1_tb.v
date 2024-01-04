/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux2to1_tb.v

Description	: 2:1 Multiplexer Testbench

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux2to1_tb();

	//Declaring the input and output ports for Testbench
	reg in0, in1, sel;
	wire out;
	
	//Declaring variable for loop iteration
	integer i;
	
	//Instantiate the multiplexer with name based order port mapping
	mux2to1 DUT(.in0(in0), .in1(in1), .sel(sel), .out(out));
	
	//Process to initialize inputs at 0ns
	initial begin
		in0 = 0;
		in1 = 0;
		sel = 0;
	end
	
	//Process to generate stimulus using for loop
	initial begin
		for(i=0;i<8;i=i+1)
		begin
			{in0,in1,sel}=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial 
		$monitor("%t ns, Input in0=%b, in1=%b, sel=%b, Output out=%b", $time,in0,in1,sel,out);
		
	//Process to terminate simulation
	initial #800 $finish;
	
endmodule