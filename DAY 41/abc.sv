///Write SV constraint to generate two 8-bit random variables such that both contain exact five 1s and both are unique.
class abc;
        rand bit[7:0] randv1;
        //rand bit[7:0] randv2;
        //constraint cond{randv1!=randv2;}
        constraint cond_ones{$countones(randv1^randv1)==5;}

        function void display();
                //$display("\nVariable1=%b\tVariable2=%b",randv1,randv2);
                $display("\nVariable1=%0b",randv1);
        endfunction: display
endclass: abc

module test;
        initial begin
                abc abc_h = new();
                //repeat(10)
                begin
                        abc_h.randomize();
                        abc_h.display();
                end
        end
endmodule
