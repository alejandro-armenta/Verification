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

endclass
