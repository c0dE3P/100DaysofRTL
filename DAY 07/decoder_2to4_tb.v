/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: decoder_2to4_tb.v

Description	: 2 to 4 Decoder Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module decoder_2to4_tb();

	// Testbench global variables
	reg en, in1, in0;
	wire y3, y2, y1, y0;
	
	integer i; //Declaring variable for loop iteration
	
	decoder_2to4 DUT(.en(en), .in1(in1), .in0(in0), .y3(y3), .y2(y2), .y1(y1), .y0(y0)); //Initializing the decoder by named based order port mapping
	
	//Process to initialize the inputs at 0ns
	initial begin
		en =1'b0; in1 =1'b0; in0 =1'b0;
	end 
	
	//Process to generate stimulus using for loop
	initial
	begin
		for(i=0; i<8; i=i+1)
		begin
			{en,in1,in0}=i;
			#10;
		end
	end
	
	//Process to monitor the changes in the variables
	initial $monitor("%t , Input Enable=%b, In0=%b, In1=%b, Output Y3=%b, Y2=%b, Y1=%b, Y0=%b",$time,en,in1,in0,y3,y2,y1,y0);
	
	initial #80 $finish; //Process to terminate simulation after 80ns

endmodule
