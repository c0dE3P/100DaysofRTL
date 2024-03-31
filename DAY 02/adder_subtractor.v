
	/******************************************************************************************************************

	This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
	This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.
	
	Filename	: adder_subtractor.v
	
	Description	: 4-bit Adder/Subtractor Design
	
	Author Name	: Deep Kar Sarkar
	
	Version		: 1.0
	
	*******************************************************************************************************************/
	
	module adder_subtractor(a, b, c_in, sum, cy);
		
		//Defining the input and output ports
		input [3:0] a;
		input [3:0] b;
		input c_in;
		output reg [3:0] sum;
		output reg cy;
		
		//Defining the adder/subtractor logic depending 
		//on the value of c_in
		always @(*)
		begin
			if(c_in==0)
				{cy,sum}=a+b+c_in;
			else
				{cy,sum}=a+(~b)+c_in;
		end 
		
	endmodule