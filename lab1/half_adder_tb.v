/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	half_adder_tb.v   

Description:	One bit Half adder TestBench 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
			 

Version:	1.0

*********************************************************************************************/

module half_adder_tb();

  reg   a,b;
  wire  sum,carry;
 
  integer i;

  //Instantiating the half adder
  half_adder HA1(.a(a), .b(b), .sum(sum), .carry(carry));

  initial 
  begin
    a   = 1'b0;
    b   = 1'b0;
  end

  initial
  begin 
    for (i=0;i<4;i=i+1)
    begin
      {a,b}=i;
      #10;
    end
  end

  initial $monitor("Input a=%b, b=%b, Output sum =%b, carry=%b",
                  a,b,sum,carry);

  initial #100 $finish;

endmodule
