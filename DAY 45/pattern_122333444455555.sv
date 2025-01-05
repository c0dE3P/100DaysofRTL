class pattern_122333444455555;
        randc int a[$];
        constraint a_size{a.size==2;}
        constraint a_content{foreach(a[i])
                                if(i>0)
                                        a[i]==pattern();}

        function int pattern();
                $display("The pattern is:");
                for(int i=1; i<=5; i++)
                begin
                        for(int j=1; j<=i; j++)
                                $write("%d",i);
                end
                $display("\n");
        endfunction: pattern
endclass: pattern_122333444455555

module test;
        initial begin
                pattern_122333444455555 p1_h = new();
                p1_h.randomize();
        end
endmodule