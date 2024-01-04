/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: jk_ff_tb.v

Description	: JK Flipflop Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module jk_ff_tb();

	reg clk, rst, J, K;
	wire Q, Q_bar;
	
	parameter CYCLE = 10; //Declaring a parameter named CYCLE and assigning it value of 10
	
	jk_ff DUT(.clk(clk), .rst(rst), .J(J), .K(K), .Q(Q), .Q_bar(Q_bar)); //Instantiation of Design
	
	//Clock generation logic
	always begin
		#(CYCLE/2);
		clk = 1'b0;
		#(CYCLE/2);
		clk = ~clk;
	end
	
	//Reset Task
	task reset();
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask
	
	//Data input Task
	task data_in(input [1:0] i);
		begin
			{J,K} = i;
		end
	endtask
	
	//Process that generates stimulus by call by value method
	initial
	begin
		reset;
		data_in(2'b00);
		data_in(2'b01);
		data_in(2'b10);
		data_in(2'b11);
		reset;
		data_in(2'b10);
		data_in(2'b01);
		#10;
		$finish;
	end

	initial $monitor("%t , Input Clock=%b, Reset=%b, J=%b, K=%b, Output Q=%b, Q_bar=%b",$time,clk,rst,J, K, Q, Q_bar);
	
endmodule
