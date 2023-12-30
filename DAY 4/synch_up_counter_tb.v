/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: synch_up_counter.v

Description	: 4-bit Synchronous Loadable Up Counter Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module synch_up_counter_tb();

	reg clk,rst,ld;
	reg [3:0] data;
	wire [3:0] count;

	parameter CYCLE = 10;

	synch_up_counter DUT(.clk(clk), .rst(rst), .ld(ld), .data(data), .count(count));

	//Clock generation logic
	always
	begin
		#(CYCLE/2);
		clk = 1'b0;
		#(CYCLE/2);
		clk = 1'b1;
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
	
	//Load task
	task load_data(input [3:0] i);
		begin
			@(negedge clk)
			begin
				ld = 1'b1;
				data = i;
			end
			@(negedge clk)
			ld = 1'b0;
		end
	endtask
			
	//Increment task
	task increment_counter();
		begin
			@(negedge clk)
			begin
				ld=1'b0;
				rst=1'b0;
			end
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial begin
		reset();
		load_data(4'b1011);
		increment_counter();
		increment_counter();
		load_data(4'b0110);
		reset();
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, Load=%b, Data=%b, Count=%b", $time,clk,rst,ld,data,count);

endmodule
