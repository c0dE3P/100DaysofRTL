/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux16to1_tb.v

Description	: 16:1 Multiplexer Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux16to1_tb();

	//Declaring the input and output ports for Testbench
	reg [15:0] in;
	reg [3:0] sel;
	wire out;
	
	//Declaring variable for loop iteration
	integer i;
	
	//Instantiate the multiplexer with name based order port mapping
	mux16to1 DUT(.in(in), .sel(sel), .out(out));
	
	//Process to initialize inputs at 0ns
	initial
	begin
		in=16'd0;
		sel=4'd0;
	end
	
	//Process to generate stimulus using for loop
	initial
	begin
		for(i=0; i<(2**20); i=i+1)
		begin
			{in,sel}=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial $monitor("%t ns, Input in=%b, sel=%b, Output out=%b",$time,in,sel,out);
	
	//Process to terminate simulation
	initial 
		#1050000 $finish;

endmodule