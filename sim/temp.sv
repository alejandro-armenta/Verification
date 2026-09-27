
module tb;

  initial begin
    
    bit [31:0] src[0:5];
    bit [0:31] dst[0:5];

    for (
      int i = 0; 
      i < $size(src);
      ++i
    ) 
    begin
      
      src[i] = i;
      dst[i] = i;

    end

    $display("%b", src[1]);
    $display("%b", dst[1]);

    $display("%b", src[1][0]);
    $display("%b", dst[1][0]);

  end

endmodule
