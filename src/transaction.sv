`include "utils.sv"

class Transaction;

  rand bit [31:0] src, dst, data[8];
  bit [31:0] csm;

  virtual function void calc_csm();

    csm = src ^ dst ^ data.xor;

  endfunction

  virtual function Transaction copy(Transaction to = null);

    if (to == null) copy = new();
    else copy = to;

    copy.csm  = this.csm;
    copy.src  = this.src;
    copy.dst  = this.dst;
    copy.data = this.data;

    return copy;

  endfunction

  virtual function void display();
    $display("%0d %0d %0b %p", src, dst, csm, data);
  endfunction

endclass

class Nearby extends Transaction;

  // estas mandando paquetes a direcciones de memoria cercanas 

  constraint c {dst inside {[src - 100 : src + 100]};}

  virtual function Transaction copy(Transaction to = null);

    Nearby nb;

    if (to == null) nb = new();
    else $cast(nb, to);

    void'(super.copy(nb));

    `SV_RAND_CHECK(nb.randomize(null));

    return nb;

  endfunction


endclass

class BadTransaction extends Transaction;

  rand bit bad_csm;

  virtual function void calc_csm();
    super.calc_csm();
    if (bad_csm) csm = ~csm;
  endfunction

  virtual function Transaction copy(Transaction to = null);

    BadTransaction bad;

    if (to == null) bad = new();
    // aqui hace un upcast a 
    else
      $cast(bad, to);

    void'(super.copy(bad));
    // super.copy(bad);

    bad.bad_csm = this.bad_csm;

    return bad;

  endfunction

  virtual function void display();
    $write("%b\n", bad_csm);
    super.display();
  endfunction

endclass

class Driver;

  mailbox #(Transaction) gen2drv;

  function new(mailbox#(Transaction) gen2drv);

    this.gen2drv = gen2drv;

  endfunction

  virtual task run();

    Transaction tr;

    forever begin
      gen2drv.get(tr);
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
      `SV_RAND_CHECK(blueprint.randomize());

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
