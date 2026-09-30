
module tb;
  function automatic void init(
      ref int f[5], input int start);
    foreach (f[i]) f[i] = i + start;
  endfunction

  typedef int fixed_array_t[5];

  function automatic fixed_array_t init_(
      input int start);

    fixed_array_t result;

    foreach (result[i])
    result[i] = i + start;

    return result;
  endfunction

  typedef int dynamic_array_t[];

  function automatic dynamic_array_t init__(
      input int start);

    dynamic_array_t result;

    result = new[5];

    foreach (result[i])
    result[i] = i + start;

    return result;

  endfunction

  dynamic_array_t f;

  initial begin

    f = init__(5);

    foreach (f[i]) $display(f[i]);

  end

endmodule


