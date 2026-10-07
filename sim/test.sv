`include "../src/transaction.sv"

module automatic test;

  BadTransaction a;

  initial begin
    a = new();
    a.calc_csm();
    a.display();
  end

endmodule

