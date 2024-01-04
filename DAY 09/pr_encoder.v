/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: pr_encoder.v

Description	: 3:8 Priority Encoder Design using Structural model

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module pr_encoder(in,idle,y);
	input [7:0]in;
	output[2:0]y;
	output idle;
	wire [7:0]h;
	
	pr_circuit c1(in,h,idle);
	encoder c2(h,y);
endmodule

