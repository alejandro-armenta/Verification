
module tb;

  import ABC::*;

  abc_data_t data;


  initial begin

    data = 32'hAABBCCDD;

    $displayh(data);

  end

endmodule
