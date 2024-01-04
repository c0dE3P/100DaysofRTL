/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: mux16to1.v

Description	: 16:1 Multiplexer Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module mux16to1(in, sel, out);

	//Define the port directions with proper size & datatypes
	input [15:0] in;
	input [3:0] sel;
	output reg out;
	
	//Write the MUX behaviour as a parallel logic using "case"
	always @(*)
	begin
		case(sel)
			4'd0: out<=in[0];
			4'd1: out<=in[1];
			4'd2: out<=in[2];
			4'd3: out<=in[3];
			4'd4: out<=in[4];
			4'd5: out<=in[5];
			4'd6: out<=in[6];
			4'd7: out<=in[7];
			4'd8: out<=in[8];
			4'd9: out<=in[9];
			4'd10: out<=in[10];
			4'd11: out<=in[11];
			4'd12: out<=in[12];
			4'd13: out<=in[13];
			4'd14: out<=in[14];
			4'd15: out<=in[15];
			default: out<=1'b0;
		endcase
	end

endmodule