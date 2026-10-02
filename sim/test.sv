
`include "../src/transaction.sv"
`include "../src/driver.sv"

program automatic test ();

  Transaction tr, tr2;

  Driver dr;

  initial begin

    tr  = new(.d(15));

    tr2 = tr;

    tr  = new();

    tr.display();

    tr2.display();

    tr = null;

    $display(Transaction::count);
  end

endprogram
