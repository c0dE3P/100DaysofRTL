/******************************************************************************************************************

Write a Verilog RTL code for the given specification:
 - Once the input "req" is detected at the posedge of clock, the output "ack" signal gets high after 5 clock cylces
 - In between 5 cycles, if input "req" is again asserted, then "ack" signal is ignored.

*******************************************************************************************************************/

module signal_detector(input clk, rst, req, output reg ack);

	reg [2:0] count;
	reg pos_edge, req_d1, flag;
	
	//ACK detected after 5 clock cycles from REQ posedge
	always@(posedge clk)
	begin
		if(rst)
			{count,flag,ack}<=0;
		else
			begin
				ack<=0;
				if(pos_edge)
					begin
						count<=count+1'b1;
						flag<=1;
					end
				else if(flag)
				begin
					ack<=0;
					if(count<5)
					begin
						count<=count+1'b1;
					end
					else
					begin
						ack<=1;
						count<=0;
						flag<=0;
					end
				end
			end 
	end
	
	//Posedge detector logic
	always@(posedge clk)
	begin
		if(rst)
			req_d1<=0;
		else
			req_d1<=req;
	end
	
	always@*
		begin
			pos_edge = 0;
			if(~req_d1 & req)
			pos_edge = 1;
		end

endmodule