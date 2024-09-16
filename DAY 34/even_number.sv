//Constraint to find out even numbers less than 100
class even;
        randc int a;
        constraint a_range{a inside {[0:100]};}
        constraint a_content{a%2==0;}

        function void post_randomize();
                $display("%d is an even number.",a);
        endfunction: post_randomize
endclass: even

module test;
        initial begin
                even ev_h = new();
                repeat(10)
                        ev_h.randomize();
                        //$write("%0d",ev_h.a);
        end
endmodule
