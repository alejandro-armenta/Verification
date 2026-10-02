module monitor (
    arb_if.MONITOR arbif
);

  always @(posedge arbif.request[0]) begin

    $display("%t request[0] asserted",
             $time);

    @(posedge arbif.grant[0]);

    $display("%t grant[0] asserted",
             $time);

  end

  always @(posedge arbif.request[1]) begin

    $display("%t request[1] asserted",
             $time);

    @(posedge arbif.grant[1]);

    $display("%t grant[1] asserted",
             $time);

  end

endmodule
