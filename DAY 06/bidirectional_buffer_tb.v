/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: bidirectional_buffer_tb.v

Description	: Bidirectional Buffer Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module bidirectional_buffer_tb();

	//Testbench global variables
	wire a, b;
	reg ctrl;
	
	reg temp_a, temp_b;
	
	integer i; //Variable for loop iteration
	
	bidirectional_buffer DUT(a, b, ctrl); //Initializing the bidirectional buffer with position based order port naming
	
	//Assigning values to port a and port b using temp_a and temp_b
	assign a = ctrl ? temp_a : 1'bz;
	assign b = ~ctrl ? temp_b : 1'bz;
	
	//Process to generate stimulus using for loop
	initial
	begin
		for(i=0;i<2**3;i=i+1)
		begin
			{temp_a,temp_b,ctrl}=i;
			#10;
		end
	end
	
	initial $monitor("%t , Control = %b, Port A = %b, Port B = %b",$time,ctrl,a,b); //Process to monitor the changes in the variables
	
	initial #80 $finish; //Process to terminate simulation after 80ns

endmodule
