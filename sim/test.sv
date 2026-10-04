
`include "../src/transaction.sv"
`include "../src/driver.sv"
`include "../src/packet.sv"

`define SV_RAND_CHECK(r)\
  do begin\
    if (!(r)) begin\
      $display("%s %d Randomization failed %s", `__FILE__, `__LINE__, `"r`");\
      $finish();\
    end\
  end while(0)

program automatic test ();

  packet a;

  initial begin

    a = new();

    repeat (32) begin
      `SV_RAND_CHECK(a.randomize());
      $display(a.src,, a.b);
    end

  end

endprogram

