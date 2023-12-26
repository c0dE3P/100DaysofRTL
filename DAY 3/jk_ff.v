/******************************************************************************************************************

This source code is a work of its author. No part of it should be copied and pasted for any commercial purpose. 
This code is purely for educational purposes. If required, this code can be cloned from GitHub repository.

Filename	: jk_ff.v

Description	: JK Flipflop Design using case

Author Name	: Deep Kar Sarkar

Version		: 1.0

*******************************************************************************************************************/

module jk_ff #(parameter HOLD = 2'b00, SET = 2'b01, RESET = 2'b10, TOGGLE = 2'b11)
	(input clk, rst, J, K, output reg Q, output Q_bar);
	
	always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else begin
            case({J, K})
                HOLD: Q <= Q; // Hold state
                    
                SET: Q <= 1'b1; // Set state
                
                RESET: Q <= 1'b0; // Reset state
                
                TOGGLE: Q <= ~Q; // Toggle state
                
                default: Q <= Q;
               
            endcase
        end
    end
	
	assign Q_bar = ~Q;

endmodule