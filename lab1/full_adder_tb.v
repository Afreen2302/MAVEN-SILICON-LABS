/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	full_adder_tb.v   

Description:	One bit Full adder TestBench 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
			 

Version:	1.0

*********************************************************************************************/

module full_adder_tb();

  reg   a,b,cin;
  wire  sum,carry;
 
  integer i;

  //Instantiate the full adder
  full_adder FA1(.a(a), .b(b), .c(cin), .sum(sum), .carry(carry));

  initial 
  begin
    a   = 1'b0;
    b   = 1'b0;
    cin = 1'b0;
  end

  initial
  begin 
    for (i=0;i<8;i=i+1)
    begin
      {a,b,cin}=i;
      #10;
    end
  end

  initial $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",
                  a,b,cin,sum,carry);

  initial #100 $finish;

endmodule
