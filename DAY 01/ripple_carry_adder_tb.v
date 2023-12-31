/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: half_adder.v

Description	: Half Adder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module ripple_carry_adder_tb();

	//Testbench global variables
	reg a0, a1, a2, a3, b0, b1, b2, b3, carry_in;
	wire sum0, sum1, sum2, sum3, carry_out;

	//Variable for loop iteration
	integer i;

	//Instantiate the half adder with name based order port mapping
	ripple_carry_adder DUT(.a0(a0), .a1(a1), .a2(a2), .a3(a3), .b0(b0), .b1(b1), .b2(b2), .b3(b3), .carry_in(carry_in), 
			.sum0(sum0), .sum1(sum1), .sum2(sum2), .sum3(sum3), .carry_out(carry_out));

	//Process to initialize the inputs at 0ns
	initial
	begin
		a0=1'b0;
		a1=1'b0;
		a2=1'b0;
		a3=1'b0;
		b0=1'b0;
		b1=1'b0;
		b2=1'b0;
		b3=1'b0;
		carry_in=1'b0;
	end

	//Process to geenrate stimulus using for loop
	initial
	begin
		for(i=0;i<(2**9);i=i+1)
		begin
			{a0,a1,a2,a3,b0,b1,b2,b3,carry_in}=i;
			#10;
		end
	end

	//Process to monitor the changes in the variables
	initial
		$monitor($time, "Input a0=%b, a1=%b, a2=%b, a3=%b, b0=%b, b1=%b, b2=%b, b3=%b, carry_in=%b, Output sum0=%b, sum1=%b, sum2=%b, sum3=%b, carry_out=%b", a0, a1, a2, a3, b0, b1, b2, b3, carry_in, sum0, sum1, sum2, sum3, carry_out);

	//Process to terminate simulation after 5200ns
	initial
		#5200 $finish;

endmodule