/******************************************************************************************************
    Communication between 2 components using MAILBOX in SystemVerilog
******************************************************************************************************/

class packet;
    rand bit [7:0] addr;
    rand bit [7:0] data;

    function void post_randomize();
        $display($time, " Packet :: Packet Generated");
        $display($time, " Packet :: Address: %0h, Data: %0h", addr, data);
    endfunction: post_randomize
endclass: packet

class component1;
    packet pkt;
    mailbox m_box;

    function new(mailbox m_box);
        this.m_box = m_box;
    endfunction: new

    task run();
        repeat(3) begin
            pkt = new();
            pkt.randomize();
            m_box.put(pkt);
            $display($time, " Component1 :: Packet put into mailbox");
            #10; // Adds a delay of 10 units
        end
    endtask: run
endclass: component1

class component2;
    packet pkt;
    mailbox m_box;

    function new(mailbox m_box);
        this.m_box = m_box;
    endfunction: new

    task run();
        repeat(5) begin
            m_box.get(pkt);
            $display($time, " Component2 :: Packet received from mailbox");
            $display($time, " Component2 :: Address: %0h, Data: %0h",pkt.addr,pkt.data);
        end
    endtask: run
endclass: component2

module test;

    component1 c1_h;
    component2 c2_h;
    mailbox m_box;

    initial begin
        m_box = new();

        c1_h = new(m_box);
        c2_h = new(m_box);
        $display("================================================================");
        fork
            c1_h.run();
            c2_h.run();
        join
        $display("================================================================");
    end

endmodule: test


/****************************************************************************************
                        RESULTS
****************************************************************************************/
     0 Packet :: Packet Generated
     0 Packet :: Address: 28, Data: a9
     0 Component1 :: Packet put into mailbox
     0 Component2 :: Packet received from mailbox
     0 Component2 :: Address: 28, Data: a9
    10 Packet :: Packet Generated
    10 Packet :: Address: df, Data: b8
    10 Component1 :: Packet put into mailbox
    10 Component2 :: Packet received from mailbox
    10 Component2 :: Address: df, Data: b8
    20 Packet :: Packet Generated
    20 Packet :: Address: b8, Data: ee
    20 Component1 :: Packet put into mailbox
    20 Component2 :: Packet received from mailbox
    20 Component2 :: Address: b8, Data: ee