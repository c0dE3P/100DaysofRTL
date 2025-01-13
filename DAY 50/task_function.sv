/******************************************************************************
Example to demonstrate function and task in SystemVerilog
******************************************************************************/

module top;

        function int mult(int a, int b);
                return a*b;
        endfunction: mult

        task show_result(int a, int b);
                int result;
                if(a==0 || b==0)
                        begin
                                $display("Multiplication not possible!!!");
                                // $display("Atleast one of the values in 0");
                                return ;
                                $display("Atleast one of the values in 0");
                        end
                else
                        begin
                                result = mult(a, b);
                                $display("Product of %0d and %0d = %0d",a, b, result);
                        end
        endtask: show_result

        initial begin
                show_result(23, 56);
                show_result(0, 56);
                show_result(23, 0);
                show_result(0, 0);
                show_result(19, 96);
                show_result(50, 100);
        end

endmodule