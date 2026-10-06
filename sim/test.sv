
// `include "../src/transaction.sv"
// `include "../src/driver.sv"
// `include "../src/packet.sv"
`include "../src/stim.sv"

`define SV_RAND_CHECK(r)\
    do begin\
      if (!(r)) begin\
        // $display("%s : %d Randomization failed %s", `__FILE__, `__LINE__, `"r`");\
        $finish();\
      end\
    end while(0)

program automatic test ();


  initial begin

    $display("%0t \tstart fork join example", $time);

    #10;

    $display("%0t \tsequential after #10", $time);

    fork

      $display("%0t \tparallel start", $time);
      #50 $display("%0t \tparallel after 50", $time);
      #10 $display("%0t \tparallel after 10", $time);

      begin

      end
    join
  end

endprogram

