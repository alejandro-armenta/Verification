
// program automatic test_with_cb (
//     arb_if.TEST arbif
// );

//   initial begin
//     // sequential
//   end

//   initial
//   fork
//     // this is parallel
//     #70ns arbif.cb.request <= 3;
//     #170ns arbif.cb.request <= 2;
//     #250ns arbif.cb.request <= 1;
//     #500ns $finish;
//   join

// endprogram



// program automatic test (
//     arb_if.TEST arbif
// );

//   initial begin

//     @arbif.cb;

//     arbif.cb.request <= 2'b01;

//     $display("%t Drove request = 01",
//              $time);

//     repeat (2) @arbif.cb;

//     a1 :
//     assert (arbif.cb.grant == 2'b11)
//     else $error("grant not asserted");
//     $finish;

//   end

// endprogram

`include "../src/transaction.sv"


program automatic test ();

  import ABC::*;

  Transaction a;

  initial begin

    a = new();

    a.addr = 4;
    
    a.display();

  end

endprogram
