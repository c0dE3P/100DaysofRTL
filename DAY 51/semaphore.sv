/******************************************************************************************************
     SEMAPHORE in SystemVerilog
******************************************************************************************************/

module semaphore;

        class driver;
                task send(input string var1);
                        sem.get(1);
                        $display("%s got key",var1);
                        sem.put(1);
                        $display("%s dropped key",var1);
                endtask: send
        endclass: driver

        driver drv[2];

        semaphore sem;

        initial begin
                drv[0] = new();
                drv[1] = new();

                sem = new(1);

                repeat(5)
                begin
                        fork
                                drv[0].send("Driver1");
                                drv[1].send("Driver2");
                        join
                end
        end

endmodule


/****************************************************************************************
                        RESULTS
****************************************************************************************/
Driver1 got key
Driver1 dropped key
Driver2 got key
Driver2 dropped key
Driver1 got key
Driver1 dropped key
Driver2 got key
Driver2 dropped key
Driver1 got key
Driver1 dropped key
Driver2 got key
Driver2 dropped key
Driver1 got key
Driver1 dropped key
Driver2 got key
Driver2 dropped key
Driver1 got key
Driver1 dropped key
Driver2 got key
Driver2 dropped key