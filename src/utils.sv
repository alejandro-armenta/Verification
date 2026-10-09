`define SV_RAND_CHECK(r) \
do begin\
  if (!(r)) begin\
    $finish;\
  end\
end while(0) 
