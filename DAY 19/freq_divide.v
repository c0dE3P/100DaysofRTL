/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: freq_divide.v

Description	: Frequency Divide By N, where can be odd, even and fraction

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module freq_divide(input clk, rst, output reg q_out);

	reg [3:0] count;

	parameter TIME_EXPANSION_FACTOR = 4.5;
	parameter DUTY = 0.5; //This corresponds to 50% duty cycle

	integer t_on = TIME_EXPANSION_FACTOR*2*DUTY;
	// real t_off = TIME_EXPANSION_FACTOR*2*(1-DUTY);
	integer total_time = TIME_EXPANSION_FACTOR*2;

	always@(posedge clk or negedge clk)
	begin
		if(rst)
			begin
				q_out<=0;
				count<=0;
			end
		else
		begin
			count<=count+1'd1;
			if(count<t_on)
				q_out<=1;
			else if(count<total_time)
				q_out<=0;
			else if(count == total_time)
			begin
				q_out<=~q_out;
				count<=1;
			end
		end
	end

endmodule
