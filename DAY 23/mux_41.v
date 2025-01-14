module mux_41(input [1:0] sel, input m4d0,m4d1,d2,d3, output out);

	assign out = (sel==2'b00) ? m4d0 : ((sel==2'b01) ? m4d1 : ((sel==2'b10) ? d2 : d3));

endmodule
