module test_with_cb (
    arb_if.TEST arbif
);

  initial begin

    @arbif.cb;

    arbif.cb.request <= 2'b01;

    @arbif.cb;

    $display("%t grant = %b", $time,
             arbif.cb.grant);

    @arbif.cb;

    $display("%t grant = %b", $time,
             arbif.cb.grant);

    $finish;

  end

endmodule
