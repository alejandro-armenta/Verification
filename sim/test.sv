
module automatic test;

  mailbox #(int) mbx;

  class producer;
    task run();
      for (int i = 1; i < 4; i++) begin
        mbx.put(i);
      end
    endtask
  endclass

  class consumer;
    task run();
      int i;
      repeat (3) begin
        mbx.get(i);
        // $display()
      end
    endtask
  endclass


  initial begin

  end

endmodule

