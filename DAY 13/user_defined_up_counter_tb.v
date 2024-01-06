/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: user_defined_up_counter.v

Description	: User Defined Synchronous Up Counter Testbench Design to count from 01100 to 11100

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module user_defined_up_counter_tb();

	//Testbench global variables
	reg clk, rst;
	wire [4:0] count;
	
	parameter CYCLE = 10; //Declaring a parameter named CYCLE and assigning it value of 10
	
	user_defined_up_counter DUT(.clk(clk), .rst(rst), .count(count)); //Instantiation of Design
	
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
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask
	
	//Increment task
	task increment_counter();
		begin
			@(negedge clk)
			rst=1'b0;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial begin
		reset();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		reset();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		increment_counter();
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, Output Count=%b",$time,clk,rst,count);

endmodule
