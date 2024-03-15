/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	half_adder.v   

Description:	Half adder design 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		     

Version:	1.0

*********************************************************************************************/

module half_adder(a,
                  b,
                  sum,
                  carry);
  input  a,
         b;
  output sum,
         carry;

  assign sum = a ^ b;
  assign carry = a & b;

endmodule
