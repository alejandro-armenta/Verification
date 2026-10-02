class Transaction;

  logic [31:0] addr, csm, data[8];

  function new(input logic [31:0] a=3, d=5);

    addr = a;
    data = {default:d};

  endfunction

  function void display();

    $display(addr);
    
    foreach(data[i])
    $display(data[i]);
    
    $display(csm);
    

  endfunction

endclass
