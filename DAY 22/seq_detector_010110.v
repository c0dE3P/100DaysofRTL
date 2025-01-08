/************************************************************************
 Verilog Code for a Sequence Detector to detect 010110 using Mealy FSM
************************************************************************/

module seq_detector_010110(input clk, rst, d_in, output reg y_out);

	parameter IDLE = 3'b000,
			S1 = 3'b001,
			S2 = 3'b010,
			S3 = 3'b011,
			S4 = 3'b100,
			S5 = 3'b101;

	reg [2:0] state, next_state;

	always @(posedge clk or posedge rst)
	begin
		if(rst)
			state <= IDLE;
		else
			state <= next_state;
	end

	always @(state or d_in)
	begin
		next_state = IDLE;
		case(state)
			IDLE: next_state <= (d_in == 1'b0) ? S1 : IDLE;
			S1: next_state <= (d_in == 1'b1) ? S2 : S1;
			S2: next_state <= (d_in == 1'b0) ? S3 : IDLE;
			S3: next_state <= (d_in == 1'b1) ? S4 : S1;
			S4: next_state <= (d_in == 1'b1) ? S5 : IDLE;
			S5: next_state <= (d_in == 1'b0) ? IDLE : S2;
			default: next_state <= IDLE;
		endcase
	end

	always @(posedge clk or posedge rst)
	begin
		if(rst)
			y_out <= 1'b0;
		else
			y_out <= (state == S5) && (d_in == 1'b0); //Mealy machine depends on current input as well as previous state
	end

endmodule