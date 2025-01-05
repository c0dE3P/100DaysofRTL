`timescale 1s/100ms;

module time_counter_tb();
	
	reg clk, rst;
	wire [3:0] ms_hr, ls_hr, ls_min, ms_min, ls_sec, ms_sec;

	time_counter DUT(clk, rst, ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);

	task rst_dut();
		begin
			@(negedge clk)
			rst=1;
			@(negedge clk)
			rst=0;
		end
	endtask

	initial begin
		clk=0;
		forever 
		#0.5 clk=~clk;
	end

	initial begin
		rst_dut();
		#(25*60*60);
		$finish;
	end

	initial begin
		$monitor($time, " Clock Counter Time = %d%d : %d%d : %d%d", ms_hr, ls_hr, ms_min, ls_min, ms_sec, ls_sec);
	end

endmodule
