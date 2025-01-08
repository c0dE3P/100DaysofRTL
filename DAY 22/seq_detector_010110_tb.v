module seq_detector_010110_tb();

	reg clk, rst, d_in;
	wire y_out;

	seq_detector_010110 DUT(clk, rst, d_in, y_out);

	//Clock generation
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	initial begin
		d_in = 0;
		rst = 0;
	end

	initial begin
		#10 rst = 1;
		#10 rst = 0;
		#10 d_in = 0;
		#10 d_in = 1;
		#10 d_in = 0;
		#10 d_in = 1;
		#10 d_in = 1;
		//#10 d_in = 1;
		#10 d_in = 0;
		#10;
		#10 rst = 1;
		#10 d_in = 0;
		#10 d_in = 1;
		#10 d_in = 1;
		#10 d_in = 1;
		#10 d_in = 1;

		#20 $finish;
	end

	initial $monitor($time, " Inputs Clock=%b, Reset=%b, D_in=%b, Output Q=%b",clk,rst,d_in,y_out);

endmodule