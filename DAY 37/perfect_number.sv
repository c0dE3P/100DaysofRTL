//Constraint to find out perfect numbers less than 1000
class perfect_number;
        randc int a[$];
        constraint a_range{a.size inside {10000};}
        constraint a_content{foreach(a[i])
                                if(i>2)
                                        a[i]==perfect(i);}

        function int perfect(int g);
                int sum=1;
                for(int i=2; i<g; i++)
                begin
                        if(g%i==0)
                                sum=sum+i;
                end
                //$display("sum=%d, g=%d",sum,g);
                if(sum==g)
                begin
                        perfect = g;
                        $display("%d is a perfect number",g);
                end
        endfunction: perfect

endclass: perfect_number

module test;
        initial begin
                perfect_number perf_h = new();
                perf_h.randomize();
        end
endmodule