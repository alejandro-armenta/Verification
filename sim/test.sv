`include "../src/transaction.sv"

module automatic test;

  Envrionment env;

  initial begin
    env = new();
    env.build();

    begin
      BadTransaction bad = new();
      env.gen.blueprint = bad;
    end

    env.run();
    env.wrap_up();
  end

endmodule

