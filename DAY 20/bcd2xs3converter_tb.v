/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: bcd2xs3converter_tb.v

Description	: BCD to XS3 Converter using 4:10 Decoder Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module bcd2xs3converter_tb();

	reg [3:0] b_in;
	wire [3:0] x_out;

	integer i;

	bcd2xs3converter DUT(b_in, x_out);

	initial begin
		b_in = 4'b0;
		//x_out = 4'b0;
	end

	initial begin
		for(i=0; i<16; i=i+1)
		begin
			b_in = i;
			#10;
		end
	end

	initial $monitor($time, "BCD Input = %b, XS3 Output=%b", b_in, x_out);

	initial #160 $finish;

endmodule
