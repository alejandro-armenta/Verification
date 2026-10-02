class Statistics;

  time startT;

  static int ntrans = 0;

  static time total_elapsed_time = 0;

  function void start();

    startT = $time;

  endfunction


  function void stop();

    time howLong = $time - startT;

    ntrans++;

    total_elapsed_time += howLong;

  endfunction




endclass
