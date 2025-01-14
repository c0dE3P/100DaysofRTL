module mux_21(input sel, d0, d1, output out);

	assign out = sel ? d1 : d0;

endmodule
