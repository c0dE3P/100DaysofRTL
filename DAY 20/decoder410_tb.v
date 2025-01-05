/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: decoder410_tb.v

Description	: 4:10 Decoder Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module decoder410_tb();

	reg [3:0] in;
	wire [9:0] out;

	integer i;

	decoder410 DUT(in, out);

	initial begin
		in = 4'd0;
	end

	initial begin 
		for(i=0; i<16; i=i+1)
		begin
			in = i;
			#10;
		end
	end

	initial $monitor($time, "Input IN=%b, Output OUT=%b", in, out);

	initial #120 $finish;

endmodule
