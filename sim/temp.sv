
module tb;

  typedef enum {
    init,
    decode = 2,
    idle
  } fsmstate_e;

  fsmstate_e pstate;

  initial begin

    pstate = pstate.first;

    do begin
      $display(pstate,, pstate.name());
      pstate = pstate.next;
    end while (pstate != pstate.first);

  end

endmodule
