module tb;
  
  initial begin
    
    int ascend[0:4];
    int descend[4:0];

    ascend[0:2] = {10,20,30};
    descend[2:0] = {30,20,10};

    $display("%p", ascend);
    $display("%p", descend);

  end

endmodule
