
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

    q = {q[0],1,q[1:$]};
    
    $display(q);

    q = {q[0:2], q2, q[3:$]};

    $display(q);
    
    // psuh fornt
    q = {6,q};
    
    $display(q);
    
    k = q[$];
    
    $display(k);
    
    q = q[0:$-1];

    $display(q);
    
    q = {q, 8};
    
    $display(q);

    k = q[0];
    
    $display(k);
    
    q = q[1:$];

    $display(q);
    
    q = {};
    
    $display(q);
do begin 
      
      ale[idx] = idx;
      
      idx = idx << 1;
        
    end while (idx != 0);
    
    // key value paris
    // hash map ordenado
    foreach (ale[i])
      $display(i, ale[i]);

    // get key of first element if exist if not return 0
    if(ale.first(idx))
      // esta es la llave!
      do 
      
      begin 
      
        $display(idx, ale[idx]); 
      
      end

      while(ale.next(idx));
      
    
    ale.first(idx);

    ale.delete(idx);

    $display(ale);


    file = $fopen("../switch.txt", "r");
    
    if (file == 0)
    
    begin 
      $display("could not open file");
      $finish;
    end 
    
    else
    
    begin
      $display("success open file");
    end


    while (!$feof(file))
    
    begin 
      
      temp = $fscanf(file, "%d %s", i, s );

      if (temp == 2)
      begin 
        
        switch[s] = i;
      
      end

    end


    $fclose(file);
    

    // foreach(switch[i])
    //   $display(i, switch[i]);


    min_address = switch["min_address"];
    
    if (switch.exists("max_address"))
      max_address = switch["max_address"];
      
    else
      max_address = 1000;


    $display(min_address,max_address);

    
element = $urandom() % (aa.size() - 1);

    $display(aa.size() - 1, element);

    foreach (aa[i]) begin
      if (count++ == element) begin
        idx = i;
        break;
      end
    end

    $display(idx, aa[idx]);
