/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	full_adder.v   

Description:	One bit Full adder design 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
			 

Version:	1.0

*********************************************************************************************/

module full_adder(a,
                  b,
                  c,
                  sum,
                  carry);

  // Step 1. Write down the directions for the ports	     
  input a,b,c;
  output sum, carry;

  // Step 2. Declare the internal wires    
  wire w1, w2, w3;

  // Step 3. Instantiate two Half-Adders
  half_adder HA1(.a(a), .b(b), .sum(w1), .carry(w2));
  half_adder HA2(.a(w1), .b(c), .sum(sum), .carry(w3));

  // Step 4. Instantiate the OR gate
  or or1(carry, w2, w3);

endmodule

