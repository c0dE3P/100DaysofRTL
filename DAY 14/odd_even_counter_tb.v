/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: odd_even_counter_tb.v

Description	: Even and Odd Counter Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module odd_even_counter_tb();

	//Testbench global variables
	reg clk, rst;
	reg [3:0] d_in;
	wire [3:0] count_odd, count_even;
	
	parameter CYCLE = 10; //Declaring a parameter named CYCLE and assigning it value of 10
	
	odd_even_counter DUT(.clk(clk), .rst(rst), .d_in(d_in), .count_odd(count_odd), .count_even(count_even)); //Instantiation of Design
	
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
	
	//Data input task
	task data_in(input [3:0] i);
		begin
			@(negedge clk)
			d_in=i;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial begin
		reset();
		data_in(4'b0011);
		data_in(4'b1010);
		data_in(4'b1011);
		data_in(4'b1010);
		data_in(4'b1011);
		reset();
		data_in(4'b0000);
		data_in(4'b1000);
		data_in(4'b1001);
		data_in(4'b1010);
		data_in(4'b1011);
		data_in(4'b1100);
		data_in(4'b1101);
		data_in(4'b1110);
		data_in(4'b1111);
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, Data_In=%b, Output Count_Odd=%b, Count_Even=%b",$time,clk,rst,d_in,count_odd,count_even);

endmodule
