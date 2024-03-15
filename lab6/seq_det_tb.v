/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	seq_det_tb.v   

Description:	Testbench for sequence detector

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/

module seq_det_tb();
       
  parameter cycle=10;

  reg  din,
       clock,
       reset;
 
  wire dout;

  seq_det SQD(.din(din),
              .clock(clock),
              .reset(reset),
              .dout(dout));
  
// Step 1. Generate clock, using parameter "cycle"   
  initial
  begin
    clock=0;	
    forever #(cycle/2) clock=~clock;
  end


// Step 2. Write a task named "initialize" to initialize 
//         the input din of sequence detector.

  task initialize;
  begin
    din = 0;
  end
  endtask


  task delay(input integer i);
  begin
    #i;
  end
  endtask
 
// Step 3. Write a task named "RESET" to reset the design,
//         use the above delay task for adding delay
  
  task RESET;
  begin
    reset=1;
    delay(10);
    reset=0;
  end
  endtask


// Step 4. Write a task named "stimulus" which provides input to
//         design on negedge of clock

  task stimulus(input j);
  begin
    @(negedge clock)
    din = j;
  end
  endtask

// Step 5 : understand the remaing logic defind below.

  initial $monitor("Reset=%b, state=%b, Din=%b, Output Dout=%b",
                   reset,SQD.present_state,din,dout);
  
  always@(SQD.present_state or dout)
  begin
     if (SQD.present_state==2'b11 && dout==1)
         $display("Correct output at state %b", SQD.present_state);
  end
 
  initial
  begin
    initialize;
    RESET;
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    RESET;
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    delay(10);    
    $finish;
  end

endmodule     
