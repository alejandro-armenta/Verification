
  function void count_calls();
  
    static int a = 0;

    static int b = 0;

    a++;
    b++;

    $display("%d %d",a,b);

  endfunction
  

    bit [31:0] src[0:5];
    bit [0:31] dst[0:5];

    for (
      int i = 0; 
      i < $size(src);
      ++i
    ) 
    begin
      
      src[i] = i;
      
    end
    
    foreach (dst[j])
      dst[j] = j;
    


    $display("%b", src[1]);
    $display("%b", dst[1]);

    $display("%b", src[1][0]);
    $display("%b", dst[1][0]);


    int ale [2][3] = '{
      '{0,1,2},
      '{3,4,5}
    };    

    
    foreach (ale[i,j])
      $display("%p",ale[i][j]);
    

      int rev[6:2];
    int rev_[2:6];
    
    foreach (rev[i])
      $display("%p, %p", i, rev[i]);
    
    $display("\n");

    foreach (rev_[i])
      $display("%p, %p", i, rev_[i]);


      begin

      bit [31:0] 
      
      src[0:4] = {0,1,2,3,4}, 
      
      dst[4:0] = {5,4,3,2,1};
      
      // este lo hace por bloque
      dst = src;
      
      $display("%p\n", dst);

      $display("%p", src[1:4]);
      $display("%p\n", dst[4:1]);
      
    end

    begin

      bit [31:0] 

      src[0:4] = {0,1,2,3,4}, 
      
      dst[0:4] = {5,4,3,2,1};

      // este lo hace por bloque
      dst = src;

      

      // los slices tampoco son iguales 
      $display("%b", src[1:4] == dst[1:4] );
    

      bit [31:0] ale[5] = '{5{5}};

    $display(
      "%0d\n%b\n%b",
      ale[0],
      ale[0][0],
      ale[0][2:1]
      );



    // bytes bits 
    bit [3:0][7:0] bytes;

    bytes = 32'hCAFE_DADA;

    // $displayh(
    //   bytes, 

    //   "\n",
      
    //   bytes[0],
    //   bytes[1],
    //   bytes[2],
    //   bytes[3],
      
    //   "\n",
      
    //   bytes[0][0],
      
    // );


    $displayb(
      bytes, 
      "\n",
      bytes[0][5:0],
    );

    end


    $display(dyn);

    dyn = new[5];

      $display(dyn);
      
      // deep copy
      dyn2 = dyn;

      foreach (dyn[i]) dyn[i] = i;
      
      $display(dyn);
      
      $display(dyn2);
      
      dyn = new[20](dyn);


      
      // dyn = new[100];

      $display(dyn);


    dyn.delete();
    
    $display(dyn);
    
    $display(d);

    d = new[4];

    $display(d);
    
    foreach (d[i]) d[i] = new[5];
    
    $display(d);
    
    foreach (d[i,j]) d[i][j] = 1;
    
    $display(d);


        // index value 
    q.insert(1, 2000);

    $display(q);

    q.delete(1);

    $display(q);
    
    q.push_front(6);
    
    $display(q);
    
    q.pop_front();
    
    $display(q);

    q.push_back(9);
    
    $display(q);

    q.pop_back();
    
    $display(q);

    q.delete();
