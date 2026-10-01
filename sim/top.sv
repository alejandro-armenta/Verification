module top;

  bit clk;

  always #50 clk = ~clk;

  arb_if arbif (clk);

  arb_with_mp a1 (arbif.DUT);

  test_with_mp t1 (arbif.TEST);

endmodule

