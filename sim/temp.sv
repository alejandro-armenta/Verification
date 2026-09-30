
module tb;

  typedef struct {
    int      a;
    byte     b;
    shortint c;
    int      d;

  } my_struct_s;

  my_struct_s st = {
    32'haaaa_aaaa,
    8'hbb,
    16'hcccc,
    32'hdddd_dddd
  };

  byte b[];

  initial begin

    b = {>>{st}};

    foreach (b[i]) begin
      $writeh(b[i]);
    end

    $display();

    b = {
      8'h11,
      8'h22,
      8'h33,
      8'h44,
      8'h55,
      8'h66,
      8'h77,
      8'h88,
      8'h99,
      8'hAA,
      8'hBB
    };

    st = {>>{b}};

    $displayh(st.a, st.b, st.c, st.d);

  end

endmodule
