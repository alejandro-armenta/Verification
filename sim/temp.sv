
module tb;

  typedef struct {
    int      a;
    byte     b;
    shortint c;
    int      d;
  } my_struct_s;

  typedef struct packed {
    bit [7:0] r, g, b;
  } pixel_p_s;

  typedef union {
    // unsigned integer
    bit [31:0] b;
    // signed integer
    int        i;
  } num_u;

  pixel_p_s a;

  initial begin

    a.r = 32'hAA;
    a.g = 32'hBB;
    a.b = 32'hCC;

    $displayh(a);

  end

endmodule
