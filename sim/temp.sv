
module tb;

  int file;
  int i;
  string s;

  int temp;

  int switch[string];

  int min_address,max_address;

  initial 
  begin

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


    

  end


endmodule
