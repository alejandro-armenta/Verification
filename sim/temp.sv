
module tb;

  int j = 1;
  int k = 0;

  int q2[$] = {3,4};
  int q[$] = '{0,2,5};


  initial begin

    q = {q[0],1,q[1:$]};
    
    $display(q);

    q = {q[0:2], q2, q[3:$]};

    $display(q);
    
    // psuh fornt
    q = {6,q};
    
    $display(q);
    
    k = q[$];
    
    $display(k);
    
    q = q[0:$-1];

    $display(q);
    
    q = {q, 8};
    
    $display(q);

    k = q[0];
    
    $display(k);
    
    q = q[1:$];

    $display(q);
    
    q = {};
    
    $display(q);

  end

endmodule
