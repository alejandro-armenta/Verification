`include "../src/transaction.sv"

module automatic test;

  Envrionment env;
  // Transaction ale;
  Nearby nb;
  BadTransaction bad;

  initial begin
    env = new();
    // ale = new();
    // nb  = new();

    bad = new();

    env.build(bad);

    env.run();

    env.wrap_up();

  end

endmodule
