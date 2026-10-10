`include "Transaction.sv"
`include "Environment.sv"
`include "Driver_Callbacks.sv"

module automatic test;

  Environment env;

  Transaction tr;

  initial begin
    env = new();

    tr  = new();
    env.build(tr);

    begin

      Driver_cbs_drop dcd = new();
      env.drv.cbs.push_back(dcd);

    end

    env.run();

    env.wrap_up();

  end

endmodule
