module top;

  import uvm_pkg::*;
  import tinyalu_pkg::*;

  `include "uvm_macros.svh"


tinyalu_bfm bfm ();

  tinyalu dut (

      .A (bfm.A),
      .B (bfm.B),
      .op(bfm.op),

      .clk(bfm.clk),
      .reset_n(bfm.reset_n),
      .start(bfm.start),

      .done  (bfm.done),
      .result(bfm.result)
  );

  initial begin

    uvm_config_db#(virtual interface tinyalu_bfm)::set(null, "*", "bfm", bfm);

    run_test();

  end

endmodule


