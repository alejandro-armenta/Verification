
function automatic void count_calls();
  
  int a = 0;
  
  static int b = 0;

  a++;
  b++;

  $display("%d %d",a,b);

endfunction

module tb;
  
  initial begin
    

    count_calls();

    count_calls();

  end

endmodule
