`include "../src/transaction.sv"

module automatic test;

  Generator g;
  Driver d;

  mailbox #(Transaction) gen2drv;

  initial begin
    gen2drv = new(10);
    g = new(gen2drv);
    d = new(gen2drv);

    fork
      g.run(1);
      d.run();
    join
  end

endmodule

