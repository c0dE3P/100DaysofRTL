
/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: clock_gen.v

Description	: Clock Signal Generator

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module clock_gen(input clk_enb, rst, output reg clk_out);

	parameter FREQ = 100; // Frequency = 100MHz represented in MHz
	parameter PHASE = 0;
	parameter DUTY = 30; // Duty cycle represented in percentage

	real t_clk = 1.0/(FREQ*1e6)*1e9; // Clock period in ns
	/*integer t_on = (DUTY/100)*t_clk;
	integer t_off = t_clk-t_on;*/
	integer t_on = 3;
	integer t_off = 7;

	initial begin
		$display("Generating clock of FREQ=%0dMHz and DUTY=%0d percent :: Clock Period=%0.3f ns, T_on=%0.3f ns and T_off=%0.3f ns",FREQ,DUTY,t_clk,t_on,t_off);
	end

	always @(*)
	begin
		if(!rst)
		begin
			if(clk_enb)
			begin
				#(t_on) clk_out <= 1'b0;
				#(t_off) clk_out <= ~clk_out;
			end
			else
				clk_out <= 1'b0;
		end
		else
			clk_out <= 1'b0;
	end

endmodule