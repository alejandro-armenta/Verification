class Statistics;


  static int count = 0;

  int id;


  time startT;

  static int ntrans = 0;

  static time total_elapsed_time = 0;

  function new();

    $display("%m");

    id = count++;

  endfunction

  function Statistics copy();

    copy = new();

    copy.startT = startT;

  endfunction

  function void start();

    startT = $time;

  endfunction


  function void stop();

    time howLong = $time - startT;

    ntrans++;

    total_elapsed_time += howLong;

  endfunction


endclass

