`include "../src/transaction.sv"

module automatic test;

  Envrionment env;
  // Transaction ale;
  Nearby nb;
  initial begin
    env = new();
    // ale = new();
    nb  = new();
    env.build(nb);
    env.run();
    env.wrap_up();
  end

endmodule
