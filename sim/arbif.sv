interface arb_if (
    input bit clk
);

  bit reset;

  logic [1:0] grant, request;


  modport TEST(
      output request, reset,
      input clk, grant
  );

  modport DUT(
      output grant,
      input request, reset, clk
  );

  modport MONITOR(
      input request, grant, reset, clk
  );


endinterface
