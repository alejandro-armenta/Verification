class Stim;

  typedef enum {
    READ,
    WRITE,
    CONTROL
  } stim_e;


  const bit [31:0] CONGEST_ADDR = 42;

  rand stim_e kind;
  rand bit [31:0] len, src, dst;
  rand bit congestion_test;

  constraint c_stim {
    len > 0;
    len < 1000;

    if (congestion_test) {
      src == CONGEST_ADDR;
      dst inside {[CONGEST_ADDR - 10 : CONGEST_ADDR + 10]};
    } else
    src inside {0, [2 : 10], [100 : 107]};
  }

endclass

class T4;

  rand bit [1:0] src, dst;

  constraint c_dist {
    src dist {
      0 := 40,
      [1 : 3] := 60
    };

    dst dist {
      0 :/ 40,
      [1 : 3] :/ 60
    };
  }

  // 40/220
  // 60/220
  // 60/220
  // 60/220

endclass


class Busop;

  typedef enum {
    BYTE,
    WORD,
    LWRD
  } length_e;

  rand length_e len;

  bit [31:0] w_byte = 1, w_word = 3, w_lwrd = 5;

  constraint c_len {
    len dist {
      BYTE := w_byte,
      WORD := w_word,
      LWRD := w_lwrd
    };
  }

endclass


class Ranges;

  rand bit [31:0] c;

  bit [31:0] low, high;

  constraint c_range {!(c inside {[low : high]});}

endclass


class Fib;

  rand bit [7:0] f;

  bit [7:0] vals[] = {1, 2, 3, 5, 8};

  constraint c_fib {(f inside vals);}


endclass

class Days;

  typedef enum {
    SUN,
    MON,
    TUE,
    WED,
    THU,
    FRI,
    SAT
  } days_e;

  days_e list[$];

  rand days_e choice;

  constraint c {choice inside list;}


endclass


class randcinside;

  int array[];

  rand bit [15:0] index;

  function new(int a[]);
    array = a;
  endfunction

  function int pick();

    return array[index];

  endfunction

  constraint c {index < array.size();}

endclass

class unconstrained;

  rand bit x;
  rand bit [1:0] y;

  // uniform distribution

endclass


class implication;

  rand bit x;
  rand bit [1:0] y;

  constraint c {(x == 0) -> (y == 0);}

  // if x == 0
  // y = 0
  // else
  // y = 0
  // y = 1 
  // y = 2
  // y = 3

  // if x = 0 y has to be 0 and if x = 1 y can be anything

  // 1/2
  // 0
  // 0
  // 0
  // 1/8
  // 1/8
  // 1/8
  // 1/8
endclass



class implication2;

  rand bit x;
  rand bit [1:0] y;

  constraint c {
    y > 0;
    (x == 0) -> (y == 0);
  }

  // 0
  // 0
  // 0
  // 0
  // 0
  // 1/3
  // 1/3
  // 1/3

endclass



class SolveXBeforeY;

  rand bit x;
  rand bit [1:0] y;

  constraint c {
    (x == 0) -> (y == 0);
    solve x before y;
  }

  // x y 
  // 0 0 1/2
  // 0 1 0
  // 0 2 0
  // 0 3 0
  // 1 0 1/8
  // 1 1 1/8
  // 1 2 1/8
  // 1 3 1/8

endclass


class SolveYBeforeX;

  rand bit x;
  rand bit [1:0] y;

  constraint c {
    (x == 0) -> (y == 0);
    solve y before x;
  }

  // x y 
  // 0 0 1/8
  // 0 1 0
  // 0 2 0
  // 0 3 0
  // 1 0 1/8
  // 1 1 1/4
  // 1 2 1/4
  // 1 3 1/4

endclass


class Packet2;

  rand bit [31:0] length;

  constraint c_short {length inside {[1 : 32]};}

  constraint c_long {length inside {[1000 : 1023]};}

endclass

class Transaction;

  typedef enum {
    BYTE,
    WORD,
    LWRD,
    QWRD
  } length_e;

  typedef enum {
    READ,
    WRITE,
    RMW,
    INTR
  } access_e;


  rand length_e length;
  rand access_e access;

  constraint c {access == RMW -> length == LWRD;}

endclass


class Transaction2;

  rand bit [31:0] addr, data;

  constraint c {addr inside {[0 : 100], [1000 : 2000]};}

endclass


class bathtub;
  int value;
  int seed   = 1;
  int DEPTH  = 6;

  function void pre_randomize();

    // value = $dist_exponential(seed, DEPTH);



  endfunction

endclass


class packet;



endclass

module tb;
  function automatic void init(ref int f[5], input int start);
    foreach (f[i]) f[i] = i + start;
  endfunction

  typedef int fixed_array_t[5];

  function automatic fixed_array_t init_(input int start);

    fixed_array_t result;

    foreach (result[i]) result[i] = i + start;

    return result;
  endfunction

  typedef int dynamic_array_t[];

  function automatic dynamic_array_t init__(input int start);

    dynamic_array_t result;

    result = new[5];

    foreach (result[i]) result[i] = i + start;

    return result;

  endfunction

  dynamic_array_t f;

  initial begin

    f = init__(5);

    foreach (f[i]) $display(f[i]);

  end

endmodule


Transaction2 a;

initial begin
  a = new();

  `SV_RAND_CHECK(
  a.randomize with {
  addr >= 50;
  addr <= 1500;
  data < 10;
  });

  $display(a.addr,, a.data);

  `SV_RAND_CHECK(
  a.randomize with {
  addr == 2000;
  data > 10;
  });

  $display(a.addr,, a.data);
end



// initial begin

//   // este se tarda mas en correr el parent thread;

//   $display("%0t \tstart fork join example", $time);

//   #10;

//   $display("%0t \tsequential after #10", $time);

//   fork

//     $display("%0t \tparallel start", $time);

//     #50 $display("%0t \tparallel after 50", $time);

//     #10 $display("%0t \tparallel after 10", $time);

//     begin
//       #30;
//       $display("%0t \tsequential after #30", $time);
//       #10;
//       $display("%0t \tsequential after #10", $time);
//     end
//   join_any

//   $display("%0t \tafter join", $time);
//   #80;
//   $display("%0t \tfinish", $time);

// end

// initial begin

//   $display("%0t \tstart fork join example", $time);

//   #10;

//   $display("%0t \tsequential after #10", $time);

//   fork

//     $display("%0t \tparallel start", $time);

//     #50 $display("%0t \tparallel after 50", $time);

//     #10 $display("%0t \tparallel after 10", $time);

//     begin
//       #30;
//       $display("%0t \tsequential after #30", $time);
//       #10;
//       $display("%0t \tsequential after #10", $time);
//     end
//   join_none

//   $display("%0t \tafter join", $time);
//   #80;
//   $display("%0t \tfinish", $time);

// end


// initial begin

//   $display("%0t \tstart fork join example", $time);

//   #10;

//   $display("%0t \tsequential after #10", $time);

//   fork

//     $display("%0t \tparallel start", $time);

//     #50 $display("%0t \tparallel after 50", $time);

//     #10 $display("%0t \tparallel after 10", $time);

//     begin
//       #30;
//       $display("%0t \tsequential after #30", $time);
//       #10;
//       $display("%0t \tsequential after #10", $time);
//     end
//   join

//   $display("%0t \tafter join", $time);
//   #80;
//   $display("%0t \tfinish", $time);

// end

for (int j = 0; j < 3; j++) begin
      automatic int k = j;
      fork
        $write(k);
      join_none
    end

    wait fork;
    $display();


    task wait_for_time_out(int id);
    if (id == 0)
      fork
        begin
          #2ns;
          $display("disable wait_for_time_out");
          disable wait_for_time_out;
        end
      join_none

    fork
      begin
        $display("entering thread");
        #1000ns;
        $display("Done");
      end
    join_none


  endtask

module automatic test;

  class Generator;
    event done;

    function new(event done);
      this.done = done;
    endfunction

    task run();
      fork
        begin
          $display("doing stuff");
          ->done;
        end
      join_none
    endtask

  endclass

  parameter N_GENERATORS = 100;

  event done[N_GENERATORS];
  Generator gen[N_GENERATORS];

  int done_count = 0;

  initial begin

    foreach (gen[i]) begin
      gen[i] = new(.done(done[i]));
      gen[i].run();
    end

    foreach (gen[i]) begin
      automatic int k = i;
      fork
        begin
          wait (done[k].triggered);
          done_count++;
        end
      join_none
    end

    wait (done_count == N_GENERATORS);

    $display(done_count);

  end

endmodule

module automatic test;

  class Generator;
    static int thread_count = 0;

    task run();
      thread_count++;

      fork
        begin
          $display("doing stuff");
          thread_count--;
        end
      join_none
    endtask

  endclass

  parameter N_GENERATORS = 100;
  Generator gen[N_GENERATORS];

  initial begin

    foreach (gen[i]) begin
      gen[i] = new();
    end

    foreach (gen[i]) begin
      gen[i].run();
    end

    wait (Generator::thread_count == 0);

    $display("finished");

  end

endmodule

module automatic test;

  // this is a mutex
  semaphore bus_key;

  initial begin

    bus_key = new(1);

    fork
      access_bus("A", 10);
      access_bus("B", 20);
    join

  end

  task access_bus(string process_name, int hold_time);

    $display("%0t \tWaiting for the bus key %s", $time, process_name);

    bus_key.get(1);

    $display("%0t \tACQUIRED key %s", $time, process_name);

    #(hold_time);

    $display("%0t \tRELEASED Key %s", $time, process_name);

    bus_key.put(1);

  endtask

endmodule


module automatic test;

  class Transaction;
    rand bit [7:0] a;
  endclass

  typedef mailbox#(Transaction) mbx_tran;

  class Generator;
    Transaction tr;
    mbx_tran mbx;

    function new(mbx_tran mbx);
      this.mbx = mbx;
    endfunction

    task run(int count);
      repeat (count) begin
        tr = new();
        tr.randomize();
        mbx.put(tr);
        $display("put %d", tr.a);
      end
    endtask
  endclass


  class Driver;

    Transaction tr;
    mbx_tran mbx;

    function new(mbx_tran mbx);
      this.mbx = mbx;
    endfunction

    task run(int count);
      repeat (count) begin
        mbx.get(tr);
        $display("get %d", tr.a);
      end
    endtask

  endclass

  int count;

  mbx_tran mbx;

  Generator gen;

  Driver drv;


  initial begin

    mbx   = new(10);

    gen   = new(mbx);
    drv   = new(mbx);

    count = $urandom_range(50);

    fork
      gen.run(count);
      drv.run(count);
    join

  end

endmodule

