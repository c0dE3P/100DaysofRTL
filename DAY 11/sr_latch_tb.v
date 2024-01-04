/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: sr_latch_tb.v

Description	: SR Latch Testbench Design using Gate level modelling

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module sr_latch_tb();

	//Testbench global variables
	reg s, r;
	wire q,q_bar;
	
	integer i; //Declaring integer for loop iteration
	
	sr_latch DUT(.s(s), .r(r), .q(q), .q_bar(q_bar)); //Initializing the design using named based order port mapping
	
	//Process to initialize the inputs at 0ns
	initial begin
		s=1'b0; r=1'b0;
	end
	
	//Process to generate stimulus using for loop
	initial
	begin
		for(i=0; i<4; i=i+1)
		begin
			{s,r}=i;
			#10;
		end
	end
	
	initial $monitor("%t , Input S=%b, R=%b, Output Q=%b, Q_bar=%b",$time,s,r,q,q_bar); //Process to monitor the changes in the variables
	
	initial #40 $finish; //Process to terminate simulation after 2560ns

endmodule
