/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: rca_32_generate_tb.v

Description	: 32-bit Ripple Carry Adder Testbench Design using generate-for

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

`define SIZE 32

module rca_32_generate_tb();

	reg [(`SIZE-1):0] a, b;
	reg cin;
	wire [(`SIZE-1):0] sum;
	wire cout;

	rca_32_generate DUT(a, b, cin, sum, cout);

	initial begin
		a=32'hdee7a25a; b=32'hc0decafe; cin=0;
		#10;
		cin=1;
		#10
		$finish;
	end

	initial $monitor($time, "Input A=%d, B=%d, C_in=%d, Outputs SUM=%d, C_out=%d", a, b, cin, sum, cout);

endmodule
