class packet;

  // repeats values
  // replacement independent
  // se multiplican las probabilidades 
  bit [7:0] src = 256;

  // takes all of them
  // not replacement dependent
  // no se multiplican las probabilidades

  randc bit [7:0] b;

  // el randc es un contraint 

  constraint c {
    src > 10;
    src < 15;
  }

endclass
