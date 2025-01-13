/*******************************************************************************
Example to demonstrate DYNAMIC ARRAY in SystemVerilog and its different methods
*******************************************************************************/

module dynamic_array;

        int da1[], da2[];

        initial begin
                da1 = new[10];
                foreach(da1[i])
                        da1[i] = i;
                $display("da1=%p", da1);

                //Code to delete the 6th element from the array
                for(int j=6; j<da1.size(); j++)
                        da1[j]=da1[j+1];
                da1=new[da1.size()-1](da1);
                $display("After deleting 6th element, da1=%p", da1);
                da2=da1;
                $display("da2=%p, Size=%0d", da2,da2.size());
                da1=new[30](da1);
                $display("Modified da1=%p, Size=%0d", da1,da1.size());
        end

endmodule: dynamic_array


/******************************************************
                    RESULTS
*******************************************************/
da1='{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
After deleting 6th element, da1='{0, 1, 2, 3, 4, 5, 7, 8, 9}
da2='{0, 1, 2, 3, 4, 5, 7, 8, 9} , Size=9
Modified da1='{0, 1, 2, 3, 4, 5, 7, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} , Size=30