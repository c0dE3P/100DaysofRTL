/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: comparator.v

Description	: 4-bit Comparator Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module comparator_tb();

	//Testbench global variables
	reg [3:0] a, b;
	wire gt, lt, eq;
	
	integer i; //Declaring an integer for loop iteration
	
	comparator DUT(.a(a), .b(b), .gt(gt), .lt(lt), .eq(eq)); //Initializing the design using named based order port mapping
	
	//Process to initialize the inputs at 0ns
	initial begin
		a=4'b0; b=4'b0;
	end
	
	//Process to generate stimulus using for loop
	initial 
	begin	
		for(i=0; i<2**8; i=i+1)
		begin
			{a,b}=i;
			#10;
		end
	end
	
	initial $monitor("%t , Input a=%b, b=%b, Output gt=%b, lt=%b, eq=%b",$time,a,b,gt,lt,eq); //Process to monitor the changes in the variables
	
	initial #2560 $finish; //Process to terminate simulation after 2560ns

endmodule
