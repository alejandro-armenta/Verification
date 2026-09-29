
module tb;

  import ABC::*;

  bit [7:0] j[4] = {
    8'h0a, 8'h0b, 8'h0c, 8'h0d
  };

  int h;

  initial begin

    h = {>>byte{j}};

    $displayh(h);

    h = {<<byte{j}};

    // solo flipea los bytes no los bits
    $displayh(h);


  end

endmodule
