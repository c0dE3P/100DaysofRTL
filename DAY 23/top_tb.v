module top_tb();

	reg a, b, sel;
	reg [1:0] sel_4to1;
	wire sum, carry, difference, borrow, out_2to1, out_4to1;
	reg d0, d1, d2, d3, m4d0, m4d1;

	integer i;

	// Instantiate the conditional_inst module with different INST_TYPE values
	top #(.INST_TYPE(2'b00)) u0(.a(a), .b(b), .sum(sum), .carry(carry));
	top #(.INST_TYPE(2'b01)) u1(.a(a), .b(b), .difference(difference), .borrow(borrow));
	top #(.INST_TYPE(2'b10)) u2(.sel(sel), .d0(d0), .d1(d1), .out_2to1(out_2to1));
	top #(.INST_TYPE(2'b11)) u3(.m4d0(d0), .m4d1(d1), .d2(d2), .d3(d3), .sel_4to1(sel_4to1), .out_4to1(out_4to1));
	
	initial begin
		a=1'b0; b=1'b0; sel=1'b0; sel_4to1=2'b00; d0=1'b0; d1=1'b0; d2=1'b0; d3=1'b0;
		m4d0=1'b0; m4d1=1'b0;
	end

	initial
	begin
		for(i=0;i<(2**11);i=i+1)
		begin
			{a,b,sel,d0,d1,sel_4to1,m4d0,m4d1,d2,d3}=i;
			#10;
		end
	end

	initial $monitor("%t ns, Input a=%b, b=%b,Output adder_sum=%b, carry=%b, Difference=%b, Borrow=%b, Input sel=%b, d0=%b, d1=%b, sel_4to1=%b, m4d0=%b, m4d1=%b, d2==%b, d3=%b, Output MUX2:1=%b,MUX4:1=%b", $time,a,b,sum,carry,difference,borrow,sel,d0,d1,sel_4to1, m4d0,m4d1,d2,d3,out_2to1, out_4to1);

	initial #20480 $finish;
	
endmodule
