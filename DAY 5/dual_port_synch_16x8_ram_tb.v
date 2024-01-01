/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: dual_port_synch_16x8_ram_tb.v

Description	: 16x8 Dual Port Synchronous RAM Testbench Design

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module dual_port_synch_16x8_ram_tb();

    reg clk;
    reg rst;
    reg wr_enb;
    reg rd_enb;
    reg [3:0] wr_addr;
    reg [3:0] rd_addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the RAM module
    dual_port_synch_16x8_ram ram (
        .clk(clk),
        .rst(rst),
        .wr_enb(wr_enb),
        .rd_enb(rd_enb),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize test signals
        clk = 0;
        rst = 1;
        wr_enb = 0;
        rd_enb = 0;
        wr_addr = 4'b0000;
        rd_addr = 4'b0000;
        data_in = 8'b00000000;

        // Release reset
        rst = 0;

        // Write data into the RAM
        wr_addr = 4'b0010;
        data_in = 8'b11001100;
        wr_enb = 1;
        #10 wr_enb = 0;

        // Read data from the RAM
        rd_addr = 4'b0010;
        rd_enb = 1;
        #10 rd_enb = 0;

        // Monitor results
        $monitor($time, "Input clk=%b, rst=%b, wr_enb=%b, rd_enb=%b, wr_addr=%b, rd_addr=%b, data_in=%b, Output data_out = %b", clk,rst,wr_enb,rd_enb,wr_addr,rd_addr,data_in,data_out);
        $finish;
    end

    // Simulate the test bench
    /*initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, test_bench);
        $display("Starting simulation...");
        $timeformat(-9, 1, " ns", 10);
        $vcdplusfile("dump.vpd");
        $vcdpluson(0);
        #50;
        $finish;
    end*/

    // Run the simulation
    initial begin
        $run;
    end
endmodule



