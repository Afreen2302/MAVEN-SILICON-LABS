/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	seq_det.v   

Description:	Sequence detector detecting "101" 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/

module seq_det(din,
               clock,
               reset,
               dout);
// Step 1. Declare the sates as parameter "IDLE","STATE1","STATE2","STATE3",
//         and use binary encoding for encoding these states.

  parameter IDLE = 2'b00,
	    STATE1 = 2'b01,
	    STATE2 = 2'b10,
	    STATE3 = 2'b11; 

// Step 2. Write down the port direction with proper directions.
  input din,clock,reset;
  output dout;

        
  reg [1:0] present_state,
            next_state;

// Step 3. Write down the sequential logic for present state
  always@(posedge clock)
  begin
    if(reset)
      present_state <= IDLE;
    else
     present_state <= next_state;
  end



// Step 4. Understand the combinational logic for next state
  always@(present_state,din)
  begin
    case (present_state)
      IDLE   : if (din==1) 
                 next_state=STATE1;
               else
                 next_state=IDLE;
      STATE1 : if (din==0)
                  next_state=STATE2;
               else
                  next_state=STATE1;
      STATE2 : if (din==1)
                   next_state=STATE3;
               else 
                   next_state=IDLE;
      STATE3 : if (din==1)
                   next_state=STATE1;
               else 
                   next_state=STATE2;
      default : next_state=IDLE;
    endcase
  end
  
// Step 5. Write down the logic for output "dout".

  assign dout = (present_state == STATE3);

endmodule
  

