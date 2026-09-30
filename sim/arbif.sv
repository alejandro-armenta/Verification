interface arb_if (
    input bit clk
);

  bit reset;

  logic [1:0] grant, request;

endinterface
