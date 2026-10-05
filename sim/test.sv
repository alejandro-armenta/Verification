
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

  integer seed = 32'hDEAD_BEEF;
  integer mean_delay = 50;

  initial begin
    repeat (20) begin
      int a = $urandom_range(3, 10);
      $display(a);
    end

    repeat (20) begin
      int unsigned a = $urandom();
      $display($unsigned(a));
    end


    repeat (20) begin
      int a = $random();
      $display(a);
    end


    repeat (20) begin
      int a = $dist_exponential(seed, mean_delay);
      $display(a);
    end
  end

endprogram

