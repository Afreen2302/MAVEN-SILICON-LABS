/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	ram.v   

Description:	Asynchronous Single port Random access memory (16x8)

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/

module ram(data,
           we,
           enable,
           addr);
      
  input we,
        enable;
  input [3:0] addr;
  inout [7:0] data;
// Step 1. Declare a 8 bit wide memory having 16 locations.
  reg [7:0]mem[15:0];

// Step 2. Understand the logic for writing data into a memory location 
  always@(data,we,enable,addr)
  if (we && !enable)
      mem[addr]=data;

// Step 3. Understand the logic of reading data from a memory location 
  assign data= (enable && !we) ? mem[addr] : 8'hzz;

endmodule 

