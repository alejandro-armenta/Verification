module top;

  bit clk;

  always #50 clk = ~clk;

  arb_if arbif (clk);

  arb_with_mp a1 (arbif.DUT);

  test_with_cb t1 (arbif.TEST);

  // monitor mon (arbif.MONITOR);

endmodule

