class packet;

  // repeats values
  // replacement independent
  // se multiplican las probabilidades 
  rand bit  [3:0] src;

  // takes all of them
  // not replacement dependent
  // no se multiplican las probabilidades

  randc bit [3:0] b;

  // el randc es un contraint 

  constraint c {
    src > 10;
    src < 15;
  }

endclass
