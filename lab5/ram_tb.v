module ram_tb;

  wire [7:0] data;
  reg  [3:0] addr;
  reg  we,enable;
  reg  [7:0] tempd;

  integer l;

// Step 1. Instantiate the RAM module and connect the ports
  ram DUT(data,we,enable,addr);

  assign data=(we && !enable) ? tempd : 8'hzz;

  task initialize();
  begin
    we=1'b0; enable=1'b0; tempd=8'h00;
  end
  endtask

  // Step 2. define body of the task named "stimulus" to inintialize the
  //         "addr" and "tempd" inputs through i and j variables.
  //         use i initialization for "addr" and j initialization for "tempd".

  task stimulus(input [3:0]i,input [7:0]j);
  begin
  //---------- define the body of the task here-----------//
    addr=i;
    tempd=j;
  end
   endtask

  // Step 3. Understand the various tasks defined in this testbench
  task write();
  begin
    we=1'b1;
    enable=1'b0;
  end
  endtask

  task read();
  begin
    we=1'b0;
    enable=1'b1;
  end
  endtask

  task delay;
  begin
    #10;
  end
  endtask

  initial
  begin
    initialize;
    delay;
    write;
    for(l=0;l<16;l=l+1)
    begin
      stimulus(l,l);
      delay;
    end
    initialize;
    delay;
    read;
    for(l=0;l<16;l=l+1)
    begin
      stimulus(l,l);
      delay;
    end
    delay;
    $finish;
  end

endmodule
