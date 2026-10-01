interface arb_if (
    input bit clk
);

  bit reset;

  logic [1:0] grant, request;


  clocking cb @(posedge clk);

    output request;

    input grant;

  endclocking

  // these are synchronous
  modport TEST(clocking cb,
      output reset
  );

  modport DUT(
      output grant,
      input request, reset, clk
  );

  modport MONITOR(
      input request, grant, reset, clk
  );


endinterface
