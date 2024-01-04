/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: pr_encoder_tb.v

Description	: 3:8 Priority Encoder Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module pr_encoder_tb();
	reg [7:0]in;
	wire [2:0]y;
	wire idle;
	integer i,chanel_1;
	
	pr_encoder DUT(in,idle,y);
	
	initial
	begin
		chanel_1=$fopen("fileoutpr1");
		$fmonitor(chanel_1,$time,"input=%b,y=%b",in,y);
	end
	
	initial
	begin
		in=8'd0;
	end
	
	initial
	begin
		for(i=0;i<256;i=i+1)
		begin
			in=i;
			#10;
		end
	end
	
	initial
		$monitor("input=%b,y=%b",in,y);
	
	initial #3000 $finish;
endmodule

