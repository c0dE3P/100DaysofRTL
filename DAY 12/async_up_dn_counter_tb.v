/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: async_up_dn_counter_tb.v

Description	: 4-bit Binary Up/Down Counter Testbench Design with Asynchronous Reset

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module async_up_dn_counter_tb();

	reg clk, rst, up_dn;
	wire [3:0] count;
	
	parameter CYCLE = 10; //Declaring a parameter named CYCLE and assigning it value of 10
	
	up_dn_counter DUT(.clk(clk), .rst(rst), .up_dn(up_dn), .count(count)); //Instantiation of Design
	
	//Clock generation logic
	always 
	begin
		#(CYCLE/2);
		clk = 1'b0;
		#(CYCLE/2);
		clk = ~clk;
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
	
	//Up-down task
	task up_down_dut(input i);
		begin
			@(negedge clk)
			up_dn = i;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial begin
		reset();
		up_down_dut(1);
		up_down_dut(1);
		up_down_dut(1);
		up_down_dut(1);
		up_down_dut(1);
		up_down_dut(0);
		up_down_dut(0);
		up_down_dut(1);
		up_down_dut(1);
		up_down_dut(0);
		reset();
		up_down_dut(1);
		up_down_dut(0);
		up_down_dut(0);
		up_down_dut(1);
		up_down_dut(1);
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, Up/Dn=%b, Output Count=%b", $time,clk,rst,up_dn,count);

endmodule