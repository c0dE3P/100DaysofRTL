module top(input a, b, sel,
		output sum, carry, difference, borrow, out_2to1, out_4to1,
		input [1:0] sel_4to1,
		input d0, d1, d2, d3, m4d0, m4d1);

	parameter [1:0] INST_TYPE=2'b00;

	generate
		case(INST_TYPE)
			2'b00: half_adder HA(.a(a), .b(b), .sum(sum), .carry(carry));
			2'b01: half_sub HS(.a(a), .b(b), .difference(difference), .borrow(borrow));
			2'b10: mux_21 MUX2(.sel(sel), .d0(d0), .d1(d1), .out(out_2to1));
			2'b11: mux_41 MUX4(.sel(sel_4to1), .m4d0(m4d0), .m4d1(m4d1), .d2(d2), .d3(d3), .out(out_4to1));
			//default: $display("Invalid INST_TYPE");
		endcase
	endgenerate

endmodule
