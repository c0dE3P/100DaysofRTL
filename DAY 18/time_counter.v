/******************************************************************************************************
Write a RTL code for a BCD counter that displays time in a 24-hr format as shown here in HH:MM:SS with 
the following specification details:
	- Input Clock Frequency is 1Hz
	- Inputs: clock(posedge), reset(Active high synchronous)
	- Outputs: ms_hr<3:0>, ls_hr<3:0>, ms_min<3:0>, ls_min<3:0>, ms_sec<3:0>, ls_sec<3:0>
******************************************************************************************************/

module time_counter(input clock, reset, output reg [3:0] ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);
	
	always @(posedge clock)
	begin
		if(reset)
			{ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec} = 0;
		else
		begin
			ls_sec<=ls_sec+1'd1;
			if(ls_sec==4'd9)
			begin
				ls_sec<=4'd0;
				ms_sec<=ms_sec+4'd1;
				if(ms_sec==4'd5)
				begin
					ms_sec<=4'd0;
					ls_min<=ls_min+4'd1;
					if(ls_min==4'd9)
					begin
						ls_min<=4'd0;
						ms_min<=ms_min+4'd1;
						if(ms_min==4'd5)
						begin
							ms_min<=4'd0;
							ls_hr<=ls_hr+4'd1;
							if(ls_hr==4'd4)
							begin
								ls_hr<=4'd0;
								ms_hr<=ms_hr+1'd1;
								if(ls_hr>=4'd3)
									begin
										{ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec} <= 0;
									end
								/*if(ms_hr==4'd2)
								begin
									if(ls_hr>=4'd3)
									begin
										{ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec} <= 0;
									end
								end*/
							end
						end
					end
				end
			end
		end
	end

endmodule
