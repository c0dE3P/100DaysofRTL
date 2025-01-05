/// Constraint to find out odd numbers less than 100
class odd_number;
        randc int a;
        constraint a_range{a inside {[0:100]};}
        constraint a_content{a%2!=0;}

        function void post_randomize();
                $display("Odd Number: %0d",a);
        endfunction: post_randomize
endclass: odd_number

module test;
        initial begin
                odd_number odno_h = new();
                repeat(10)
                        odno_h.randomize();
        end
endmodule