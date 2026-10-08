class Transaction;

  rand bit [31:0] src, dst, data[8];
  bit [31:0] csm;

  virtual function void calc_csm();

    csm = src ^ dst ^ data.xor;

  endfunction

  virtual function Transaction copy();
    copy = new();
    copy.csm = this.csm;
    copy.src = this.src;
    copy.dst = this.dst;
    copy.data = this.data;
    return copy;
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

  virtual function BadTransaction copy();

    copy = new();

    copy.csm = this.csm;
    copy.src = this.src;
    copy.dst = this.dst;
    copy.data = this.data;
    copy.bad_csm = this.bad_csm;

    return copy;

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
      $write("DRV: ");
      tr.display();
      // tr.calc_csm();

    end
  endtask

endclass

class Generator;

  mailbox #(Transaction) gen2drv;
  Transaction blueprint;

  function new(mailbox#(Transaction) gen2drv);
    this.gen2drv = gen2drv;
    blueprint = new();
    // empieza a randomizar con el nuevo y este ya no existe
    // usa ese en todo 
  endfunction

  virtual task run(int num_tr = 10);

    repeat (num_tr) begin

      // es polimorphica
      blueprint.randomize();

      $write("GEN: ");
      blueprint.display();
      gen2drv.put(blueprint.copy());

    end

  endtask

endclass

class Envrionment;

  Generator gen;
  Driver drv;

  // aqui le defines la clase base y utiliza las heredadas
  // aqui realmente esta pasando bad y estoy usando bad no es 
  mailbox #(Transaction) gen2drv;

  virtual function void build();
    this.gen2drv = new();
    this.gen = new(this.gen2drv);
    this.drv = new(this.gen2drv);

  endfunction

  // se lo cambiaste aqui

  virtual task run();

    fork
      gen.run();
      drv.run();
    join

  endtask

  virtual task wrap_up();
    // call scoreboard for report
  endtask

endclass
