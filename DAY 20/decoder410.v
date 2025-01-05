/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: decoder410.v

Description	: 4:10 Decoder

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module decoder410(in, out);

	input [3:0] in;
	output reg [9:0] out;

	always@(*)
	begin
		case(in)
			4'd0: out <= 10'd1;
			4'd1: out <= 10'd2;
			4'd2: out <= 10'd4;
			4'd3: out <= 10'd8;
			4'd4: out <= 10'd16;
			4'd5: out <= 10'd32;
			4'd6: out <= 10'd64;
			4'd7: out <= 10'd128;
			4'd8: out <= 10'd256;
			4'd9: out <= 10'd512;

			default: out <= 10'd0;
		endcase
	end

endmodule
