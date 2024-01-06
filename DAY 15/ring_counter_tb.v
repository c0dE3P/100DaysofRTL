/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: ring_counter_tb.v

Description	: Ring Counter Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module ring_counter_tb();

	//Testbench global variables
	wire [3:0]count;
	reg clk, rst;
	
	parameter CYCLE = 10; //Declaring a parameter named CYCLE and assigning it value of 10
	
	ring_counter dut(.clk(clk), .rst(rst), .count(count)); //Instantiation of Design
	
	//Clock generation logic
	always 
	begin
		#(CYCLE/2);
		clk=1'b0;
		#(CYCLE/2);
		clk=~clk;
	end
	
	//Reset task
	task reset();
		begin
			@(negedge clk)
			rst=1'b1;
			@(negedge clk)
			rst=1'b0;
		end
	endtask
	
	//Counter operation task
	task ringcounter_op();
		begin
			@(negedge clk)
			rst=1'b0;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial
	begin	
		reset();
		ringcounter_op();
		ringcounter_op();
		reset();
		ringcounter_op();
		ringcounter_op();
		ringcounter_op();
		ringcounter_op();
		ringcounter_op();
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, Output Count=%b",$time,clk,rst,count);
	
endmodule
