
module tb;

  int f[6] = {1, 6, 2, 6, 8, 6};

  int d[] = {2, 4, 6, 8, 10};

  int q[$] = {1, 6, 2, 6, 8, 6};

  int q2[$];
  int q3[$];
  int q4[$];

  initial begin

    q2 = q.min();
    q3 = q.max();
    q4 = q.unique();

    $display(q2);
    $display(q3);
    $display(q4);



  end

endmodule
