module arb_with_mp (
    arb_if.DUT arbif
);

  always_ff @(posedge arbif.clk or posedge arbif.reset) begin

    if (arbif.reset)
      arbif.grant <= 2'b00;
    else if (arbif.request[0])
      arbif.grant <= 2'b01;
    else if (arbif.request[1])
      arbif.grant <= 2'b10;
    else arbif.grant <= 2'b00;

  end


endmodule
