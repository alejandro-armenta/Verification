`include "../src/transaction.sv"

module automatic test;

  Extended a;

  Base b;

  initial begin
    a = new(.val(3));
    b = new(.val(4));

    $display(b.val);
    $display(a.val);
  end

endmodule

