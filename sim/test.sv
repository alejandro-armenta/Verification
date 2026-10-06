
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
        #30;
        $display("%0t \tsequential after #30", $time);
        #10;
        $display("%0t \tsequential after #10", $time);
      end
    join_none

    $display("%0t \tafter join", $time);
    #80;
    $display("%0t \tfinish", $time);

  end


  // initial begin

  //   $display("%0t \tstart fork join example", $time);

  //   #10;

  //   $display("%0t \tsequential after #10", $time);

  //   fork

  //     $display("%0t \tparallel start", $time);

  //     #50 $display("%0t \tparallel after 50", $time);

  //     #10 $display("%0t \tparallel after 10", $time);

  //     begin
  //       #30;
  //       $display("%0t \tsequential after #30", $time);
  //       #10;
  //       $display("%0t \tsequential after #10", $time);
  //     end
  //   join

  //   $display("%0t \tafter join", $time);
  //   #80;
  //   $display("%0t \tfinish", $time);

  // end

endprogram

