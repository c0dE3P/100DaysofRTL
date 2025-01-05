module signal_detector_tb();

	reg clk, rst, req, flag;
	reg [2:0] count;
	wire ack;

	parameter CYCLE=10;

	signal_detector DUT(clk, rst, req, ack);

	always begin
		#(CYCLE/2) clk=1'b0;
		#(CYCLE/2) clk=~clk;
	end

	task reset();
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask

	task detect_req(input i);
		begin
			@(negedge clk)
			//rst=1'b0;
			req=i;
		end
	endtask

	initial begin
		reset();
		detect_req(0);
		detect_req(0);
		detect_req(1);
		detect_req(0);
		detect_req(0);
		detect_req(0);
		detect_req(0);
		detect_req(0);
		detect_req(0);
		detect_req(1);
		detect_req(0);
		detect_req(0);
		detect_req(1);
		detect_req(0);
		reset();
		detect_req(0);
		detect_req(0);
		detect_req(1);
		detect_req(0);
		#10;
		$finish;
	end
	
	initial $monitor("%t , Input Clock=%b, Reset=%b, REQ=%b Output ACK=%b",$time,clk,rst,req,ack);

endmodule
