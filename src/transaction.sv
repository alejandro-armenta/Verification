package ABC;

  class Transaction;

    bit [31:0] addr, csm, data[8];

    function void display();
      $display(addr);
    endfunction

  endclass

endpackage
