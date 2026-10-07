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
