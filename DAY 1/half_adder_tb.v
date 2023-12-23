/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: half_adder_tb.v

Description	: Half Adder Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module half_adder_tb();

	//Testbench global variables
	reg a, b;
	wire sum, carry;

	//Variable for loop iteration
	integer i;

	//Instantiate the half adder with name based order port mapping
	half_adder DUT(.a(a), .b(b), .sum(sum), .carry(carry));

	//Process to initialize the inputs at 0ns
	initial
	begin
		a=1'b0;
		b=1'b0;
	end

	//Process to geenrate stimulus using for loop
	initial
	begin
		for(i=0;i<4;i=i+1)
		begin
			{a,b}=i;
			#10;
		end
	end

	//Process to monitor the changes in the variables
	initial
		$monitor($time, "Input a=%b, b=%b, Output sum=%b, carry=%b", a, b, sum, carry);

	//Process to terminate simulation after 100ns
	initial
		#100 $finish;

endmodule
