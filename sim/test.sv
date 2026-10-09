`include "../src/transaction.sv"

module automatic test;

  Envrionment env;

  initial begin
    env = new();
    env.build();

    begin
      // BadTransaction bad = new();
      // env.gen.blueprint = bad;
      Nearby nb = new();
      env.gen.blueprint = nb;
    end

    env.run();
    env.wrap_up();
  end

endmodule

module automatic test_bad;

  Transaction tr;
  BadTransaction bad, bad2;

  initial begin

    // bad = new();

    tr = new();

    // this copies to bad2 if it is really a bad;
    if ($cast(bad2, tr)) begin
      $display("success %b", bad2.bad_csm);
    end else begin
      $display("error");
    end

  end
endmodule
