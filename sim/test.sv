program automatic test ();

  import ABC::*;

  // tr is null
  Transaction tr;
  Driver dr;

  initial begin

    tr = new(.d(15));
    tr.display();


  end

endprogram
