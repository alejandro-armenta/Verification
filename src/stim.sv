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
