/******************************************************************************************************
     EVENT in SystemVerilog
******************************************************************************************************/

module test_event;

        event ev; //Declaring an event named ev

        initial begin
                $display("about to drive ctrl after 10 time units");
                #10;
                $display("control driven after time t = %t",$time);
                -> ev;  //Triggering the event named ev
        end

        /*initial begin
                $display("about to drive data");
                #10;
                @(ev);  //Block process, wait for future event -- not triggered at current time
                $display("data driven after time t = %t",$time);
        end*/

        initial begin
                $display("about to trigger data");
                #10;
                wait(ev.triggered);     //Block process, wait for event, including this timeslot -- reduces race conditions
                $display("event triggered after time t = %t",$time);
        end

endmodule


/****************************************************************************************
                        RESULTS
****************************************************************************************/
about to drive ctrl after 10 time units
about to trigger data
control driven after time t =     10
event triggered after time t =    10