module arbiter (
    input logic [1:0] request,
    input logic clk,
    input logic reset,
    output logic [1:0] grant
);

  // asynchronous reset
  always_ff @(posedge clk or posedge reset) begin

    if (reset) grant <= 2'b00;

    else begin
      case (request)
        2'b01:   grant <= 2'b01;
        2'b10:   grant <= 2'b10;
        2'b11:   grant <= 2'b01;
        default: grant <= 2'b00;
      endcase
    end

  end



endmodule
