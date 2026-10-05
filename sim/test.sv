
`include "../src/transaction.sv"
`include "../src/driver.sv"
`include "../src/packet.sv"
`include "../src/stim.sv"

`define SV_RAND_CHECK(r)\
  do begin\
    if (!(r)) begin\
      // $display("%s : %d Randomization failed %s", `__FILE__, `__LINE__, `"r`");\
      $finish();\
    end\
  end while(0)

program automatic test ();
  Packet2 a;

  initial begin

    a = new();

    a.c_short.constraint_mode(0);

    `SV_RAND_CHECK(a.randomize());

    $display(a.length);

    a.constraint_mode(0);

    a.c_short.constraint_mode(1);

    `SV_RAND_CHECK(a.randomize());

    $display(a.length);

  end

endprogram

