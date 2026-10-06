class packet;

  rand bit [31:0] length;
  bit [31:0] max_length = 100;

  constraint c {length inside {[1 : max_length]};}

endclass

typedef enum {
  READ8,
  READ16,
  READ32
} read_e;

class readcommands;

  rand read_e read_cmd;

  int read8_wt = 1, read16_wt = 1, read32_wt = 1;

  constraint c {
    read_cmd dist {
      READ8  := read8_wt,
      READ16 := read16_wt,
      READ32 := read32_wt
    };
  }

endclass
