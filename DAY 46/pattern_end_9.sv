class pattern_end_9;
        rand int a[];
        constraint a_size{a.size==8;}
        constraint a_content{foreach(a[i])
                                a[i]==(i*10)+9;}

        function void post_randomize();
                foreach(a[i])
                        $write("%d",a[i]);
        endfunction: post_randomize
endclass: pattern_end_9

module test;
        initial begin
                pattern_end_9 pe9_h = new();
                pe9_h.randomize();
        end
endmodule