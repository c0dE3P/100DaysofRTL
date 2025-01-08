/*****************************************************************************
 Example to demonstrate QUEUE datatype and its inbuilt methods
 viz., insert, delete, size, sum, product, sort, rsort, shuffle, reverse, etc.
 in SystemVerilog
******************************************************************************/

class queue_op;
        int q1[$] = {1,3,4,5,6};
        int k = 2;
        int q2[$];
        int sum, pdt, and_count, xor_count;
        int mq;

        function void queue_insert();
                repeat(3)
                        q1.insert(1,k);
        endfunction

        function void queue_display();
                $display("Queue q1=%0p", q1);
                //Printing only the elements of the queue
                /*foreach(q1[i])
                        $write("%d", q1[i]);*/
                q1.delete(2);
                $display("Queue after deleting element, q1=%0p", q1);
                q1.push_back(6);
                $display("Queue after push_back, q1=%0p", q1);

                //Array reducing methods
                sum=q1.sum;
                $display("sum=%0d",sum);
                pdt=q1.product;
                $display("Product=%0d",pdt);
                and_count=q1.and with(item>4);
                $display("AND Count=%0d",and_count);
                xor_count=q1.xor with(item>4);
                $display("XOR Count=%0d", xor_count);

                //Array ordering methods
                q1.reverse();
                $display("Queue after reverse, q1=%0p", q1);
                q1.shuffle();
                $display("Queue after shuffle, q1=%0p", q1);
                q1.sort();
                $display("Queue after sort, q1=%0p", q1);
                q1.shuffle();
                 $display("Queue after shuffle, q1=%0p", q1);
                 q1.rsort();
                 $display("Queue after rsort, q1=%0p", q1);

                 //Array location methods
                 /*mq=q1.find with(item==2);
                 $display("q1.find=%0d",mq);
                 mq=q1.find_first with(item==2);
                 $display("q1.find_first=%0d",mq);*/

                 //Copying the 1st queue to 2nd queue
                 q2=q1;
                 $display("Queue q2=%0p", q2);
         endfunction
 endclass

 module test;

         int q[$];
         int mq1[$];

         initial begin
                 queue_op qu_h = new();
                 qu_h.queue_insert();
                 qu_h.queue_display();
                 q = {1,2,1,3,4,5,7,7,6,9,3};
                 $display("mq1=%p",q.find with (item==7));
         end
 endmodule




 /******************************************************
                    RESULTS
 ******************************************************/
 Queue q1='{1, 2, 2, 2, 3, 4, 5, 6}
 Queue after deleting element, q1='{1, 2, 2, 3, 4, 5, 6}
 Queue after push_back, q1='{1, 2, 2, 3, 4, 5, 6, 6}
 sum=29
 Product=8640
 AND Count=0
 XOR Count=1
 Queue after reverse, q1='{6, 6, 5, 4, 3, 2, 2, 1}
 Queue after shuffle, q1='{2, 3, 1, 4, 5, 2, 6, 6}
 Queue after sort, q1='{1, 2, 2, 3, 4, 5, 6, 6}
 Queue after shuffle, q1='{6, 4, 1, 2, 6, 2, 5, 3}
 Queue after rsort, q1='{6, 6, 5, 4, 3, 2, 2, 1}
 Queue q2='{6, 6, 5, 4, 3, 2, 2, 1}
 mq1='{7, 7}