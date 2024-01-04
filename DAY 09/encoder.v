/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: encoder.v

Description	: Encoder Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module encoder(in,y);
	input [7:0]in;
	output [2:0]y;
	
	assign y[2]=in[4]+in[5]+in[6]+in[7];
	assign y[1]=in[2]+in[3]+in[6]+in[7];
	assign y[0]=in[1]+in[3]+in[5]+in[7];
endmodule
