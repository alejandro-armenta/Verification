
  function void count_calls();
  
    static int a = 0;

    static int b = 0;

    a++;
    b++;

    $display("%d %d",a,b);

  endfunction
  
