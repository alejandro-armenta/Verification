`include "../src/transaction.sv"

module automatic test;

  Extended a;

  initial begin
    a = new(.val(3));
    $display(a.val);
  end

endmodule

