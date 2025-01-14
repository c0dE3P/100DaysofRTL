module half_sub(input a, b, output difference, borrow);

	assign difference = a^b;
	assign borrow = (~a)&b;

endmodule
