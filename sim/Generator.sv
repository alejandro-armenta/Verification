`ifndef GENERATOR_SV
`define GENERATOR_SV

`include "Utils.sv"
`include "Transaction.sv"

class Generator;

  mailbox #(BaseTR) gen2drv;
  BaseTR blueprint;

  function new(mailbox#(BaseTR) gen2drv, BaseTR blueprint);
    this.gen2drv   = gen2drv;
    this.blueprint = blueprint;
  endfunction

  virtual task run(int num_tr = 10);

    BaseTR copy;

    repeat (num_tr) begin

      // es polimorphica
      `SV_RAND_CHECK(blueprint.randomize());

      copy = blueprint.copy();

      $write("GEN: ");

      copy.display();

      gen2drv.put(copy);

    end

  endtask

endclass

`endif
