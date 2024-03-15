/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	mux4_1.v   

Description:	4:1 mux design

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/
 
module mux4_1(a,
              sel,
              y);

// Step 1 : Define the port directions with proper datatypes and ranges. 
     
  input [3:0] a;	
  input [1:0] sel;
  output reg y;


// Step 2 : Write the MUX behaviour as a parallel logic using case statement in behaviour modelling.


  always@(*)	
  begin
    case(sel)
      2'd0:y=a[0];
      2'd1:y=a[1];
      2'd2:y=a[2];
      2'd3:y=a[3];
    endcase
  end

endmodule
  
