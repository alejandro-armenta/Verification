
`include "../src/transaction.sv"
`include "../src/driver.sv"

program automatic test ();

  T2 a, b;

  initial begin

    a = new();

    a.data[0] = 1;
    a.data[1] = 5;

    b = a.copy();

    b.data[2] = 10;

    foreach (a.data[i]) $display(a.data[i]);

    foreach (b.data[i]) $display(b.data[i]);

  end

endprogram

