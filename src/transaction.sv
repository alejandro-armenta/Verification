class Transaction;

  rand bit [31:0] src, dst, data[8];
  bit [31:0] csm;

  virtual function void calc_csm();

    csm = src ^ dst ^ data.xor;

  endfunction

  virtual function void display();
    $display("%0d %0d %0b %p", src, dst, csm, data);
  endfunction

endclass

class BadTransaction extends Transaction;

  rand bit bad_csm;

  virtual function void calc_csm();
    super.calc_csm();
    if (bad_csm) csm = ~csm;
  endfunction

  virtual function void display();
    $write("%b\n", bad_csm);
    super.display();
  endfunction

endclass

class Base;
  int val;
  function new(int val);
    this.val = val;
  endfunction

endclass


class Extended extends Base;

  function new(int val);
    super.new(val);
  endfunction

endclass

class Driver;

  mailbox #(Transaction) gen2drv;

  function new(mailbox#(Transaction) gen2drv);

    this.gen2drv = gen2drv;

  endfunction

  virtual task run();
    // this is a pointer polymorphico
    Transaction tr;

    // solo esta viendo la parte de transaccion la clase base
    forever begin
      // aqui van a llegar como badtransactions 
      // porque son transaccions
      // you can send badtransactions porque aceptan esa interface
      gen2drv.get(tr);
      // here it call BadTransaction::calc_csm
      // polymorphism
      tr.calc_csm();
      tr.display();

    end
  endtask

endclass

class Generator;

  mailbox #(Transaction) gen2drv;
  Transaction tr;

  function new(mailbox#(Transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  virtual task run(int num_tr = 10);

    repeat (num_tr) begin
      tr = new();
      tr.randomize();
      tr.display();
      gen2drv.put(tr);
    end

  endtask


endclass

