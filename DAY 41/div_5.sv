class div_5;
        randc int a;
        constraint a_range{a inside{[1:100]};}
        constraint a_content{a%5==0;}

        function void post_randomize();
                $display("%d is divisible by 5",a);
        endfunction: post_randomize
endclass: div_5

module test;
        initial begin
                div_5 dv_h = new();
                repeat(20)
                        dv_h.randomize();
        end
endmodule: test