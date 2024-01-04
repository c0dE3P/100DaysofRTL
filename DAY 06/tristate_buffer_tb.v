/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: tristate_buffer_tb.v

Description	: Tri State Buffer Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module tristate_buffer_tb();

	//Testbench global variables
	reg in, en;
	wire out;
	
	integer i; //Variable for loop iteration
	
	tristate_buffer DUT(.in(in), .en(en), .out(out)); //Instantiate the tri-state buffer with name based order port mappping
	
	//Process to initialize the inputs at 0ns
	initial 
	begin
		in = 1'b0;
		en = 1'b0;
	end
	
	//Process to generate stimulus using for loop
	initial begin
		for(i=0; i<4; i=i+1)
		begin
			{in,en}=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial $monitor("%t , Input  Enable=%b, In=%b, Output Out=%b",$time,en,in,out);
	
	//Process to terminate simulation after 40ns
	initial #40 $finish;
	
endmodule
