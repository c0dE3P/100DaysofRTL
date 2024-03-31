
	/******************************************************************************************************************

	This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
	This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.
	
	Filename	: adder_subtractor.v
	
	Description	: 4-bit Adder/Subtractor Testbench
	
	Author Name	: Deep Kar Sarkar
	
	Version		: 1.0
	
	*******************************************************************************************************************/
	
	module adder_subtractor_tb();
		
		//Declaring the input and output ports for Testbench
		reg [3:0] a;
		reg [3:0] b;
		reg c_in;
		wire [3:0] sum;
		wire cy;
		
		//Declaring variable for loop iteration
		integer i;
		
		//Instantiate the multiplexer with name based order port mapping
		adder_subtractor DUT(.a(a), .b(b), .c_in(c_in), .sum(sum), .cy(cy));
		
		//Process to initialize inputs at 0ns
		initial begin
			a=4'b0000;
			b=4'b0000;
			c_in=0;
		end 
		
		//Process to generate stimulus using for loop
		initial begin
			for(i=0; i<512; i=i+1)
			begin
				{a,b,c_in}=i;
				#10;
			end
		end
		
		//Process to monitor the changes in the variables
		initial $monitor("%t ns, Input A=%b, B=%b, Carry_In=%b, Output Sum=%b, Carry_Out=%b",$time,a,b,c_in,sum,cy);
	
		//Process to terminate simulation
		initial 
			#5120 $finish;
		
	endmodule