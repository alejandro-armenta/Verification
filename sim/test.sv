`include "../src/transaction.sv"

module automatic test;

  BadTransaction a;

  Transaction b;

  initial begin
    a = new();
    a.calc_csm();
    a.display();
  end

endmodule

