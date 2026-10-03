`include "statistics.sv"


class T2;

  logic [31:0] addr, csm, data[8];


  function new();

    $display("in %m");

  endfunction

  function T2 copy();
    // hay una variable aqui?
    copy = new();

    copy.addr = addr;
    copy.csm = csm;
    copy.data = data;

  endfunction

endclass


class T3;

  logic [31:0] addr, csm, data[8];

  static int count = 0;

  int id;

  Statistics stats;

  function new();

    $display("in %m");

    stats = new();

    id = count++;

  endfunction


endclass

class Transaction;

  static int count = 0;

  int id;

  logic [31:0] addr, csm, data[8];

  Statistics stats;

  function new(input logic [31:0] a = 3, d = 5);

    stats = new();

    id = count++;

    addr = a;

    data = '{default: d};

  endfunction


  task transmit_me();

    stats.start();

    #100;

    stats.stop();

  endtask

  extern function void display();

endclass


function void Transaction::display();

  $display(id);

endfunction

