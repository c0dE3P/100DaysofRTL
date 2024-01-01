/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: dual_port_synch_16x8_ram.v

Description	: 16x8 Dual Port Synchronous RAM Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module dual_port_synch_16x8_ram(clk,rst,wr_enb,rd_enb,wr_addr,rd_addr,data_in,data_out);

	//Defining the input and output ports
	input clk,rst,wr_enb,rd_enb;
	input [3:0] wr_addr;
	input [3:0] rd_addr;
	input [7:0] data_in;
	output reg [7:0] data_out;
	
	reg [7:0] mem [15:0]; //Defining the memory with width & depth
	
	integer i; //Declaring integer varibale 
	
	//Logic for 16x8 dual port synchronous RAM 
	always @(posedge clk)
	begin
		if(rst)
		begin
			for(i=0;i<16;i=i+1)
				mem[i]<=0;
			data_out<=0;
		end 
		else
		begin
			if(wr_enb)
				mem[wr_addr]<=data_in;
			if(rd_enb)
				data_out<=mem[rd_addr];
		end
	end 

endmodule
