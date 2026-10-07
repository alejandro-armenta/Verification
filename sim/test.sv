
module automatic test;

  class Transaction;
    rand bit [7:0] a;
  endclass

  typedef mailbox#(Transaction) mbx_tran;

  class Generator;
    Transaction tr;
    mbx_tran mbx;

    function new(mbx_tran mbx);
      this.mbx = mbx;
    endfunction

    task run(int count);
      repeat (count) begin
        tr = new();
        tr.randomize();
        mbx.put(tr);
        $display("put %d", tr.a);
      end
    endtask
  endclass


  class Driver;

    Transaction tr;
    mbx_tran mbx;

    function new(mbx_tran mbx);
      this.mbx = mbx;
    endfunction

    task run(int count);
      repeat (count) begin
        mbx.get(tr);
        $display("get %d", tr.a);
      end
    endtask

  endclass

  int count;

  mbx_tran mbx;

  Generator gen;

  Driver drv;


  initial begin

    mbx   = new(10);

    gen   = new(mbx);
    drv   = new(mbx);

    count = $urandom_range(50);

    fork
      gen.run(count);
      drv.run(count);
    join

  end

endmodule

