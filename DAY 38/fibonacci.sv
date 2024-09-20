class fibonacci;
        randc int a[];
        constraint a_size{a.size==10;}
        constraint a_content{foreach(a[i])
                                if(i<2)
                                        a[i]==1;
                                else
                                        (a[i]==a[i-1]+a[i-2]);}
endclass: fibonacci

module test;
        initial begin
                fibonacci fbn_h = new();
                fbn_h.randomize();
                foreach(fbn_h.a[i])
                        $write("%d",fbn_h.a[i]);
        end
endmodule