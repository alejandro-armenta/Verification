`include "../src/transaction.sv"

module automatic test;

  // Envrionment env;

  // initial begin
  //   env = new();
  //   env.build();

  //   begin
  //     Nearby nb = new();
  //     env.gen.blueprint = nb;
  //   end

  //   env.run();
  //   env.wrap_up();
  // end

endmodule

module automatic test_bad;

  // it uses the objects type not the handles type 
  Transaction a;

  initial begin

    a = new();

  end
endmodule
