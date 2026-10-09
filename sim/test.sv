`include "../src/transaction.sv"

module automatic test;

  Envrionment env;
  Transaction ale;
  initial begin
    env = new();
    ale = new();
    env.build(ale);
    env.run();
    env.wrap_up();
  end

endmodule
