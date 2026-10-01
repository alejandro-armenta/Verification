module test_with_cb (
    arb_if.TEST arbif
);

  initial begin



  end

endmodule

// module test_with_mp (
//     arb_if.TEST arbif
// );

//   initial begin

//     @(posedge arbif.clk);

//     arbif.request <= 2'b10;

//     $display("%t drove req=01", $time);

//     repeat (2) @(posedge arbif.clk);

//     if (arbif.grant == 2'b01)
//       $display(
//           "%t success grant == 01",
//           $time
//       );
//     else
//       $display(
//           "%t error grant != 01", $time
//       );

//     $finish;
//   end


// endmodule
