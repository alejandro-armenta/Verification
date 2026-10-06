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

  initial begin

    foreach (gen[i]) begin
      gen[i] = new(.done(done[i]));
      gen[i].run();
    end

    foreach (gen[i]) begin
      automatic int k = i;
      fork
        wait (done[k].triggered);
      join_none
    end

    wait fork;

    $display("finished");

  end

endmodule

