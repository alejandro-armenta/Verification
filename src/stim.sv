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

  constraint c_range {c inside {[low : high]};}

endclass
