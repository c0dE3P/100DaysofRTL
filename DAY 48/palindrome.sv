class palindrome_number;
        rand int unsigned a;
        int pop1;
        rand int unsigned b;
        rand bit odd_even;

        constraint valid_c{a inside {[12319:12323]};}
        constraint a_c{reverse_num_1(a,odd_even)==b;}

        function int unsigned reverse_num_1(int a, bit odd_even);
                int pop1;
                int c;
                int reverse_num;
                c=a;
                //$display("a=%0d",a);
                //$display("odd_even=%b",odd_even);
                /*if(odd_even)
                        a=a/10;
                        $display("a=%0d",a);*/
                while(a>0)
                begin
                        pop1 = a%10;
                        //$display("pop1=%0d",pop1);
                        reverse_num = reverse_num*10 + pop1;
                        //$display("reverse_num=%0d",reverse_num);
                        a=a/10;
                        //$display("a=%0d",a);
                        c=c*10;
                        //$display("c=%0d",c);
                end
                c=c+reverse_num;
                //$display("c=%0d",c);
                //return c;
                return reverse_num;
        endfunction: reverse_num_1

        function void post_randomize();
                if(a==b)
                        $display("a=%d, b=%d\t%0d is a palindrome",a,b,a);
                else
                        $display("a=%d, b=%d\t%0d is not a palindrome",a,b,a);
        endfunction: post_randomize
endclass: palindrome_number

module test;
        initial begin
                palindrome_number pa_h = new();
                repeat(5)
                        pa_h.randomize();
                /*begin
                        assert(pa_h.randomize());
                        $display("b1=%0d, b2=%0d",pa_h.a,pa_h.b);
                end*/
        end
endmodule